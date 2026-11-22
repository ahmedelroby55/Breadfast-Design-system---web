# Breadfast Skills

Claude skills for the Breadfast team.
Maintained by the Product Design team.

---

## Available Skills

| Skill | Description | Version |
|---|---|---|
| `breadfast-design` | Brand identity, design tokens, and UI components for the Breadfast admin panel | V1.2 |
| `breadfast-ux-writing` | On-brand UX writing guidelines for English and Arabic (RTL) product copy — voice, grammar, components, and the Arabic Egyptian / Hybrid / MSA register mapping | V1.0 |
| `breadfast-publish` | Deploy a prototype to Breadfast's prototype hosting (publish.apps.breadfast.com) and get a shareable link | V1.0 |

---

## How to Install

> ⏱ Takes less than 2 minutes. You only do this once per skill.

### Step 1 — Open Claude Settings

Go to [claude.ai](https://claude.ai), click your profile picture in the bottom-left corner, then select **Settings**.

### Step 2 — Go to the Skills tab

In the Settings sidebar, click **Skills**.

### Step 3 — Add the skill

Click **Add skill from URL** and paste the URL for the skill you want:

| Skill | Install URL |
|---|---|
| `breadfast-design` | `https://raw.githubusercontent.com/ahmedelroby55/breadfast-skills/main/breadfast-design/SKILL.md` |
| `breadfast-ux-writing` | `https://raw.githubusercontent.com/ahmedelroby55/breadfast-skills/main/breadfast-ux-writing/SKILL.md` |
| `breadfast-publish` | `https://raw.githubusercontent.com/ahmedelroby55/breadfast-skills/main/breadfast-publish/SKILL.md` |

### Step 4 — Confirm

Click **Add**. The skill appears in your Skills list.

> **Multi-file skills.** `breadfast-design`, `breadfast-ux-writing`, and `breadfast-publish` each ship extra files (components, references, or scripts) in their folder. If your install method only pulls the single `SKILL.md`, download **`breadfast-skills.zip`** from this repo instead and add the whole skill folder — that keeps the referenced files alongside it.

### ✅ You're done

Claude applies the skill automatically when it's relevant. Starting a new conversation loads skills fresh.

---

## Troubleshooting

**Skill not triggering?** Make sure it's toggled **on** in your Skills list.

**Getting outdated output?** Start a new conversation — Claude loads skills fresh at the start of each chat.

**URL not working?** The repo must be **Public** on GitHub; private repos need auth and won't work with URL installs.

---

## How to Update a Skill (for maintainers)

1. Edit the relevant file — `SKILL.md`, a component/reference/script file, or `CHANGELOG.md`.
2. Update that skill's `CHANGELOG.md` with what changed and the new version.
3. Bump the version in the README table (and in the skill's frontmatter if it carries one).
4. Re-zip the package (`breadfast-skills.zip`) if you want the bundled download current.
5. Commit and push to `main`.

The team gets the update automatically on their next Claude session.

---

## Repo Structure

```
breadfast-skills/
├── breadfast-design/          ← brand identity + admin-panel components
│   ├── SKILL.md
│   ├── CHANGELOG.md
│   └── components/            ← nav-bar, buttons, inputs, data-display
├── breadfast-ux-writing/      ← bilingual UX writing guidelines
│   ├── SKILL.md
│   ├── CHANGELOG.md
│   └── references/            ← english-style, arabic-style
├── breadfast-publish/         ← deploy a prototype to Breadfast hosting
│   ├── SKILL.md
│   ├── CHANGELOG.md
│   └── scripts/               ← deploy, package, save-cookie
├── breadfast-skills.zip       ← the whole package as one download
└── README.md
```

---

## Contributing

Have a new skill, component, or fix?

1. Create a branch: `git checkout -b update/skill-name`
2. Make your changes and update the relevant `CHANGELOG.md`
3. Open a PR → tag the design lead for review
4. Merge to `main` when approved
