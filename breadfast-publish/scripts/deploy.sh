#!/usr/bin/env bash
# Talk to https://publish.apps.breadfast.com using the saved login cookie.
#
# Usage:
#   deploy.sh check                    -> is the saved cookie still logged in?
#   deploy.sh info   <site>            -> current release of a site
#   deploy.sh new    <zip>             -> create a new site from a zip
#   deploy.sh update <site> <zip>      -> upload a new release to an existing site
#   deploy.sh parse  <site-or-link>    -> print the site id from any link form
#
# <site> can be the id (p6sxsn3h), the live link (https://p6sxsn3h.apps.breadfast.com)
# or the admin link (https://publish.apps.breadfast.com/my-sites/p6sxsn3h).
#
# Output: KEY=value lines on stdout (SITE_ID, URL, ADMIN_URL, RELEASE).
# Exit codes: 0 ok, 2 login needed (cookie missing/expired), 1 other error.
set -uo pipefail

BASE="https://publish.apps.breadfast.com"
COOKIE_FILE="${BREADFAST_PUBLISH_COOKIE:-$HOME/.config/breadfast-publish/cookie}"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

die()  { echo "ERROR: $*" >&2; exit 1; }
need_login() { echo "LOGIN_NEEDED: $*" >&2; exit 2; }

parse_id() {
  local s="$1" id
  id=$(printf '%s' "$s" | grep -oE 'my-sites/[a-z0-9]+' | head -1 | cut -d/ -f2)
  [ -z "$id" ] && id=$(printf '%s' "$s" | grep -oE '([a-z0-9]+)\.apps\.breadfast\.com' | grep -v '^publish\.' | head -1 | cut -d. -f1)
  [ -z "$id" ] && printf '%s' "$s" | grep -qE '^[a-z0-9]{4,}$' && id="$s"
  [ -n "$id" ] || die "Could not find a site id in: $s"
  printf '%s' "$id"
}

cookie() {
  [ -s "$COOKIE_FILE" ] || need_login "no saved cookie at $COOKIE_FILE"
  tr -d '\r\n' < "$COOKIE_FILE"
}

# GET a page; fail with exit 2 if we got bounced to the login page.
get() {
  local path="$1" out="$2" code redir
  read -r code redir < <(curl -s -o "$out" -w '%{http_code} %{redirect_url}\n' \
    -H "Cookie: $(cookie)" "$BASE$path")
  if [[ "$redir" == *"/login"* || "$redir" == *"/auth/"* ]] || grep -q 'Sign in to manage your static sites' "$out" 2>/dev/null; then
    need_login "session expired"
  fi
  [ "$code" = 200 ] || die "GET $path returned HTTP $code"
}

site_ids() { grep -oE 'href="/my-sites/[a-z0-9]+"' "$1" | cut -d/ -f3 | tr -d '"' | awk '!seen[$0]++'; }

active_release() {
  # The first release id after the "Active Release" label.
  python3 -I - "$1" <<'PY'
import re, sys
h = open(sys.argv[1], encoding="utf-8", errors="ignore").read()
i = h.find("Active Release")
m = re.search(r"r\d{8}-\d{3}", h[i:] if i >= 0 else h)
print(m.group(0) if m else "")
PY
}

report() {
  local id="$1" rel="$2"
  echo "SITE_ID=$id"
  echo "URL=https://$id.apps.breadfast.com"
  echo "ADMIN_URL=$BASE/my-sites/$id"
  echo "RELEASE=$rel"
}

upload() {
  local path="$1" zip="$2" code redir
  [ -f "$zip" ] || die "zip not found: $zip"
  read -r code redir < <(curl -s -o "$TMP/upload.html" -w '%{http_code} %{redirect_url}\n' \
    -H "Cookie: $(cookie)" -H "Origin: $BASE" -H "Referer: $BASE$path" \
    -F "site_zip=@${zip};type=application/zip" "$BASE$path")
  if [[ "$redir" == *"/login"* || "$redir" == *"/auth/"* ]]; then need_login "session expired"; fi
  case "$code" in
    2*|3*) : ;;
    *) local msg; msg=$(sed 's/<[^>]*>/ /g' "$TMP/upload.html" | tr -s ' \n' ' ' | head -c 400)
       die "upload returned HTTP $code: $msg" ;;
  esac
  echo "$redir"
}

cmd="${1:-}"; shift || true
case "$cmd" in check|info|new|update) [ -s "$COOKIE_FILE" ] || need_login "no saved cookie at $COOKIE_FILE" ;; esac
case "$cmd" in
  parse)
    parse_id "${1:?site link required}"; echo ;;

  check)
    get /my-sites "$TMP/list.html"
    echo "LOGGED_IN=yes"
    echo "SITES=$(site_ids "$TMP/list.html" | wc -l | tr -d ' ')" ;;

  info)
    id=$(parse_id "${1:?site required}") || exit 1
    get "/my-sites/$id" "$TMP/site.html"
    report "$id" "$(active_release "$TMP/site.html")" ;;

  new)
    zip="${1:?zip required}"
    get /my-sites "$TMP/before.html"
    site_ids "$TMP/before.html" > "$TMP/before.txt"
    redir=$(upload /upload "$zip") || exit $?
    id=$(printf '%s' "$redir" | grep -oE 'my-sites/[a-z0-9]+' | cut -d/ -f2)
    if [ -z "$id" ]; then
      # Fall back to diffing the site list.
      get /my-sites "$TMP/after.html"
      id=$(site_ids "$TMP/after.html" | grep -vxF -f "$TMP/before.txt" | head -1)
    fi
    [ -n "$id" ] || die "Upload was accepted but the new site could not be found. Check $BASE/my-sites"
    get "/my-sites/$id" "$TMP/site.html"
    report "$id" "$(active_release "$TMP/site.html")" ;;

  update)
    id=$(parse_id "${1:?site required}") || exit 1
    zip="${2:?zip required}"
    get "/my-sites/$id" "$TMP/site.html"
    before=$(active_release "$TMP/site.html")
    upload "/my-sites/$id/upload-release" "$zip" >/dev/null || exit $?
    get "/my-sites/$id" "$TMP/site.html"
    after=$(active_release "$TMP/site.html")
    report "$id" "$after"
    echo "PREVIOUS_RELEASE=$before"
    [ "$after" != "$before" ] || echo "WARNING: active release did not change - check $BASE/my-sites/$id" >&2 ;;

  *)
    sed -n '2,16p' "$0" >&2; exit 1 ;;
esac
