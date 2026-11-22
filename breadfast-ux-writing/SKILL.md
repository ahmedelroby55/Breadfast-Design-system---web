---
name: breadfast-ux-writing
description: >-
  Breadfast's UX writing guidelines for on-brand English and Arabic (RTL)
  product copy. Use whenever writing, reviewing, editing, or localizing any UI
  text for Breadfast or its apps — buttons, titles, error/success messages,
  empty states, bottom sheets, modals, notifications, tooltips, placeholders,
  banners — or when asked to check copy, fix wording, make copy "on brand", or
  produce bilingual EN/AR strings. Covers voice & tone, grammar & style,
  component rules, and the Arabic formality mapping (Egyptian / Hybrid / MSA),
  numerals, and common typo fixes. Trigger even when the user doesn't say
  "guidelines" — any Breadfast UX copy task, Figma copy review, or
  translations.json Arabic check should use it.
---

# Breadfast UX Writing

Breadfast is a daily-life app (groceries, bakery, coffee, delivery, fintech) serving customers and delivery associates in Egypt. Its product copy is **bilingual**: English and Arabic (RTL). Use this skill to write or review any UI text so it reads as one consistent voice.

Two reference files hold the full detail — read the one you need:
- **English:** [references/english-style.md](references/english-style.md) — voice, grammar & style, word choices, and per-component rules.
- **Arabic:** [references/arabic-style.md](references/arabic-style.md) — the formality mapping (Egyptian / Hybrid / MSA), grammar, word choices, per-component rules, and the recurring typo/fix list.

Load a reference when you need the specifics (e.g. date formats, the full component table, Arabic register for a given screen). For quick work the cheat-sheets below are usually enough.

## Voice

Breadfast is **empathetic, confident, humble, and friendly** — a household essential, never arrogant or stiff. In copy that means: **simple, concise, transparent, approachable.**

- Be clear and direct, especially in core UX (buttons, errors, modals). Serious ≠ formal.
- Active voice. Helpful, not apologetic ("This number is registered. Try another." — not "Sorry, …").
- Write positively: say what the user *can* do, not just what failed.
- Plain words over formal ones: Help not Assistance, Start not Commence, Get not Obtain, Need not Require, Fix not Resolve, To not In order to.

## English cheat-sheet

- **Sentence case everywhere** — titles, buttons, labels. Only capitalize the first word and Breadfast brand terms (Breadfast Card, Pay, Brekkie by Breadfast). Not "Cash Transactions" → "Cash transactions".
- **No "please"** in instructions or errors. "Select a payment method" not "Please select…".
- **Buttons:** start with a strong action verb; 1–2 words ideal, up to 3–4 if needed; clear on its own; no first person (I/me/my). "Place order", "Start now".
- **Titles/headlines:** action verb first, specific not generic, no articles unless essential, **not phrased as a question**, no end period.
- **Messages:** full sentences, end with a period; no jargon; don't repeat info.
- **Bottom sheets / modals:** users scan **Headline → CTA → Body**. Put the primary action in the headline *and* the CTA, but don't make them word-for-word identical. Keep the body short.
- **Active voice** for errors, success, pop-ups. Passive only to soften blame or when the actor is unknown/unimportant.
- **Numbers:** numerals in errors / tight space; commas over 3 digits (1,000). **Dates:** `2 Sep 2025, 02:59 AM` (abbreviated month, AM/PM uppercase). **Money:** code before amount — `EGP 100`. **%** symbol, not "percent". Serial (Oxford) comma in lists. **&** only in menus/buttons/short phrases, spell out "and" in body text.
- **Exclamation marks** only for genuinely good news (delivery arrived, offer, new feature) — never on errors, instructions, or routine confirmations.

## Arabic cheat-sheet

Pick the register by context (the **formality mapping** — full detail in the Arabic reference):
- **Egyptian (عامية):** notifications, marketing, promos, and most **delivery-associate / captain** app copy — friendly and conversational.
- **Hybrid MSA-Egyptian:** buttons, transactions, success messages, empty states — clear MSA verbs + natural everyday words.
- **Modern Standard Arabic (فصحى):** errors, legal, policy — professional and credible.

Core Arabic rules:
- **No tashkeel** (diacritics) in UI text — except the rare case where a bare word is genuinely ambiguous (e.g. keep the shadda on "حدّثه", "فعّل", "سلّم").
- **Direct second person** ("أنت" / "ـك"); never "حضرتك".
- **No "من فضلك"/"برجاء"** in routine instructions, errors, or buttons.
- **Helpful, not apologetic** — state the problem then the fix; avoid "خطأ/فشل/عفواً".
- **Numerals:** decide once per project — Arabic-Indic (٠-٩) is the guideline default, but **follow the user's instruction** (many screens keep Western digits, and IDs/reference codes always stay as-is). Currency code after the amount in Arabic.
- **Punctuation:** Arabic comma ، (not Latin ,) ; no space before ؟ or : .
- Active voice; end instructional messages with a full stop.

### Recurring Arabic typos to catch (seen across Breadfast files)
`اجمالي→إجمالي` · `الابلاغ/أبلاغ→الإبلاغ` · `تاكيد→تأكيد` · `مأكد→مؤكد` · `ايصال→إيصال` · `ادخال→إدخال` · `اسناد→إسناد` · `وسلية→وسيلة` · `علي (meaning "on")→على` · `اي→أي` · `مكن/مكنة→ماكينة` · `اليوم , →اليوم،` · trailing-minus amounts `2000- ج.م → -2,000 ج.م`.

## Reviewing existing copy (Figma, sheets, JSON)

When auditing rather than writing:
1. **Separate errors from decisions.** Spelling, grammar, hamza, agreement, broken placeholders = fix. Register choice, program-name language, a term like "streak" = flag for the team, don't silently decide.
2. **Check consistency across screens** — the same label, button, and status should read identically everywhere; call out drift.
3. **Preserve placeholders** (`{count}`, `{days}`, `{amount}`) and **IDs/reference numbers** exactly.
4. **Respect the project's number convention** — don't convert digit systems unless asked.
5. **Watch plural/agreement forms** — Arabic differs for 1, 2, 3–10, and 11+ (يوم واحد / يومان / أيام / يومًا); flag where one hardcoded form won't cover the range.
6. Report what you changed and what you left for a decision, with the reason.

## Producing bilingual output

Default to a small table — Element · English · Arabic — plus a one-line rationale tied to the rule applied (e.g. "action-first title", "Hybrid register for a transactional sheet"). When a choice is a judgment call (register, verb, term), name it and offer the alternative rather than deciding silently.
