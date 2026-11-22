---
name: breadfast-publish
description: Deploy a prototype to Breadfast's prototype hosting site (publish.apps.breadfast.com, live at links like abc12345.apps.breadfast.com). Builds the project if needed, zips the static output with index.html at the root, then creates a new site or uploads a new release to the site this project already deployed to. Use whenever the user wants to deploy, publish, ship, push live, share a link, upload, put online, or "update the prototype / the site / the link", or mentions publish.apps.breadfast.com or an *.apps.breadfast.com link, even if they don't say "deploy".
---

# Breadfast Publish

Puts the prototype in the current folder online at Breadfast's prototype hosting site, https://publish.apps.breadfast.com, and gives the user a shareable link like `https://abc12345.apps.breadfast.com`.

## Who you're talking to

Most people using this skill are designers, PMs and other non-technical teammates. So:
- Talk in plain words: "your prototype", "the link", "your login". Avoid words like zip, build, cookie, header, HTTP, exit code or script, unless the user clearly uses them.
- Do all the technical work yourself. The only things the user should ever do are: answer a question, paste a link, or copy their login once in a while (Step 2).
- Keep updates short: one line while working ("Getting your prototype ready...", "Uploading..."), and the link at the end.
- If something fails, explain what happened in one plain sentence and what you're doing about it. Don't paste raw error output unless they ask.

## The tools

Three helper scripts live in this skill's `scripts/` folder. Below, `<skill-dir>` means the folder this SKILL.md is in. That's the "Base directory for this skill" shown when the skill loads, and it differs from person to person depending on how they installed it. Always replace `<skill-dir>` with that real full path before running a command, including in the command you give the user in Step 2, so they can run it as is.

| Script | What it does |
|---|---|
| `package.sh "<folder>"` | Gets the prototype ready. If it's a project with a build step (React, Vite and so on), it builds it first. It then makes a zip of only the finished files with `index.html` at the top level, and prints the zip's path on its **last line**. |
| `deploy.sh check` | Checks the saved login still works. |
| `deploy.sh parse "<link>"` | Turns any site link into the site ID (for example `abc12345`). |
| `deploy.sh new "<zip>"` | Creates a brand-new site. |
| `deploy.sh update "<site_id>" "<zip>"` | Uploads a new version to an existing site. |
| `save-cookie.sh` | The **user** runs this to save their login (Step 2). |

`deploy.sh` prints results as lines like `SITE_ID=abc12345`, `URL=https://abc12345.apps.breadfast.com`, `RELEASE=r20261111-001`. Its exit code tells you what happened:
- **0**: it worked.
- **2**: the login is missing or expired. Go to Step 2, then retry.
- **1**: something else went wrong. Read the error and see "When things go wrong".

The site's link is remembered in a file called `.breadfast-publish.json` in the prototype's folder. This is what lets later deploys happen with no questions.

---

## Step 1: Work out where to deploy

1. Work out the prototype folder. It's normally the current working directory. If the user named a different folder, use that one.
2. Look for `.breadfast-publish.json` in that folder.

**A. The file exists and has a `site_id`.** This project was deployed before. Go straight to Step 2 without asking anything, and use mode **update** with that `site_id`. Tell the user in one line:
> Updating your prototype at https://abc12345.apps.breadfast.com...

The one exception is when the user's message asks for something else, such as "make a new site" or "put it on this other link". Do what they asked, and overwrite the file in Step 5.

**B. The file doesn't exist.** This is the first deploy from this folder. Ask with the AskUserQuestion tool:
- Question: "Where should I put this prototype?"
- Option 1: **Create a new site**. "You'll get a brand-new link."
- Option 2: **Update an existing site**. "Replace what's on a link you already have."

If they pick **Create a new site**, use mode **new**.

If they pick **Update an existing site**, ask:
> Please paste the link of the site you want to update. It looks like `https://abc12345.apps.breadfast.com`.

Then run `deploy.sh parse "<what they pasted>"` to get the site ID, and use mode **update**. Any of these forms work: `https://abc12345.apps.breadfast.com`, `https://publish.apps.breadfast.com/my-sites/abc12345`, or just `abc12345`. If parsing fails, ask them to copy the link from the address bar of the open site, or from the "My Sites" list.

## Step 2: Make sure the login works

Run `deploy.sh check`.
- **Exit 0** (`LOGGED_IN=yes`): continue to Step 3.
- **Exit 2**: the user needs to save their login. Send them the message below exactly as written, then **stop and wait** for them to say it's done.

> To upload for you, I need your login for the publish site. You only have to do this once, and again every few weeks if it expires. Here's how:
>
> 1. In **Google Chrome**, open https://publish.apps.breadfast.com/my-sites and make sure you're signed in.
> 2. Press **Cmd + Option + I**. A panel opens on the side or bottom of the window.
> 3. At the top of that panel, click the **Network** tab. If you can't see it, click **»** to find it.
> 4. Reload the page with **Cmd + R**.
> 5. In the list that appears, click the line called **my-sites**.
> 6. On the right, click **Headers**, then scroll down to **Request Headers**.
> 7. Find the row called **cookie**, right-click it, and choose **Copy value**.
> 8. Click the **Run** button on the line below (or paste it into Terminal and press Enter):
>
> ```bash
> bash <skill-dir>/scripts/save-cookie.sh
> ```
>
> You should see **"Login works."** Tell me when it does.

Important:
- Never ask the user to paste their login into the chat. It's a password-like secret. The script takes it straight from their clipboard into a private file at `~/.config/breadfast-publish/cookie` and never shows it.
- Don't run `save-cookie.sh` yourself. The user copies the value and runs it, so they're in control of their login.
- When they say it's done, run `deploy.sh check` again. If it still fails, they most likely copied the wrong row or weren't signed in. Ask them to repeat steps 5 to 8, making sure they click **my-sites** and copy the **cookie** row.
- If they can't do this (no Chrome, or they're stuck), use the **Plan B** at the end instead.

## Step 3: Get the prototype ready

Tell the user "Getting your prototype ready...", then run:

```bash
bash <skill-dir>/scripts/package.sh "<prototype folder>"
```

Take the zip path from the **last line** of the output.

Then check the result:
- The log should say either "Plain static site" or "Using build output: dist/" (or a similar folder name). Both are fine.
- If the folder has server or backend code (a `server/` or `api/` folder, Express, a database), only the visual front end can be hosted on this site. Tell the user that in one sentence before continuing.
- If the build fails, it's almost always a real bug in the prototype. Fix it, then run `package.sh` again. Tell the user in one line: "Fixed a small error that stopped the prototype from building."
- If the log says no `index.html` was found, the prototype's main page isn't where expected. Look for the folder that contains `index.html` and run `package.sh` on that folder.

## Step 4: Upload

Tell the user "Uploading...", then run one of these:
- Mode **new**: `bash <skill-dir>/scripts/deploy.sh new "<zip>"`
- Mode **update**: `bash <skill-dir>/scripts/deploy.sh update "<site_id>" "<zip>"`

The result:
- **Exit 0**: note the `SITE_ID`, `URL` and `RELEASE` values, then go to Step 5.
- **Exit 2**: the login expired during the upload. Do Step 2, then run this step again. The zip from Step 3 can be reused.
- **Exit 1**: see "When things go wrong".
- If the output contains `WARNING: active release did not change`, the upload may not have taken effect. Tell the user, and give them the admin link (`ADMIN_URL`) so they can check.

## Step 5: Remember the link and tell the user

1. Write `.breadfast-publish.json` in the prototype folder, replacing any old version, using the values from Step 4:

```json
{
  "site_id": "abc12345",
  "url": "https://abc12345.apps.breadfast.com",
  "admin_url": "https://publish.apps.breadfast.com/my-sites/abc12345",
  "last_release": "r20261111-001",
  "last_deployed": "2026-11-11T09:30:00Z"
}
```

2. Optionally confirm it's live: `curl -s -o /dev/null -w '%{http_code}' "<URL>"` should print `200`. A new site can take a few seconds to appear, so wait a moment and retry once before worrying.

3. Tell the user, using this shape:

> Your prototype is live: **https://abc12345.apps.breadfast.com**
> (version r20261111-002). Next time you say "deploy", I'll update this same link automatically.

On a first deploy, keep the second sentence, because it tells them why there won't be any questions next time. On repeat deploys you can drop it.

---

## When things go wrong

| What you see | What it means | What to do |
|---|---|---|
| Exit 2 / `LOGIN_NEEDED` | The login is missing or expired | Step 2, then retry |
| `upload returned HTTP 4xx` with a message about a limit | The account has hit its site or version limit | Tell the user, and suggest deleting old sites or versions at https://publish.apps.breadfast.com/my-sites |
| `upload returned HTTP 413` | The prototype is too big | Look for large images or videos in the output and suggest compressing them |
| `upload returned HTTP 5xx` | The hosting site has a problem | Wait about 30 seconds and retry once. If it fails again, tell the user the site seems to be down |
| `GET /my-sites/<id> returned HTTP 404` | That site doesn't exist or isn't theirs | Ask the user to double-check the link. If the saved link in `.breadfast-publish.json` is wrong, delete the file and start again at Step 1 |
| The page is blank or missing styles after deploy | Asset paths assume a sub-folder | In Vite, set `base: './'` (or `/`) in `vite.config`, then repeat from Step 3 |

Never delete, disable or overwrite a site unless the user clearly asked for it. Updating the saved site in Step 1 A counts as asked, because that's the whole point of the saved link.

## Plan B: Upload through the browser pane (no saved login)

Use this only if the user can't save their login. It needs one drag from them, because the browser pane can't pick up files from the Mac by itself.

1. Do Step 3 to make the zip.
2. Open the right page in the app's browser pane (the `preview_start` tool with `url`):
   - New site: `https://publish.apps.breadfast.com/upload`
   - Update: `https://publish.apps.breadfast.com/my-sites/<site_id>`

   If it shows "Continue with Google", ask the user to sign in there first.
3. Run `open -R "<zip>"` so Finder shows the file, then tell the user:
   > I've opened the upload page on the right, and the file is highlighted in Finder. Drag the file onto the upload box, then click **Publish Site** (or **Initiate Upload** for an update). Tell me when it's done.
4. When they confirm, read the browser pane's page to find the site ID (the `abc12345.apps.breadfast.com` text) and the "Active Release" value. Then do Step 5 as normal.
