# Breadfast Skills

Claude skills for the Breadfast admin platform.  
Maintained by the Product Design team.

---

## Available Skills

| Skill | Description | Version |
|---|---|---|
| `breadfast-design` | Brand identity, design tokens, and UI components for the Breadfast admin panel | V1.2 |

---

## How to Install

> ⏱ Takes less than 2 minutes. You only do this once.

### Step 1 — Open Claude Settings

Go to [claude.ai](https://claude.ai) and click your profile picture in the bottom-left corner, then select **Settings**.

### Step 2 — Go to the Skills tab

In the Settings sidebar, click **Skills**.

### Step 3 — Add the skill

Click **Add skill from URL** and paste the URL for the skill you want to install:

| Skill | Install URL |
|---|---|
| `breadfast-design` | `https://raw.githubusercontent.com/ahmedelroby55/breadfast-skills/main/breadfast-design/SKILL.md` |


### Step 4 — Confirm

Click **Add**. The skill will appear in your Skills list as `breadfast-design-v1.2`.

### ✅ You're done

Claude will now automatically apply Breadfast's design system whenever you ask it to build a UI, component, or screen.

**You never need to reinstall.** When the skill is updated, Claude picks up the changes automatically on your next session.

---

### Troubleshooting

**Skill not triggering?**
Make sure the skill is toggled **on** in your Skills list. Some skills are off by default.

**Getting outdated output?**
Try starting a new conversation — Claude loads skills fresh at the start of each chat.

**URL not working?**
Make sure the repo is set to **Public** on GitHub. Private repos require authentication and won't work with URL installs.

---

## How to Update a Skill (for maintainers)

1. Edit the relevant file — `SKILL.md`, a component file, or `CHANGELOG.md`
2. Update `CHANGELOG.md` with what changed and the new version
3. Update the version number in `SKILL.md` frontmatter
4. Commit and push to `main`

The team gets the update automatically on their next Claude session.

---

## Repo Structure

```
breadfast-skills/
└── breadfast-design/
    ├── SKILL.md               ← main skill file (install URL points here)
    ├── CHANGELOG.md           ← full version history
    └── components/
        ├── nav-bar.md         ← AdminNav, NAV_ITEMS, App Shell
        ├── buttons.md         ← Primary, Secondary, Text buttons
        ├── inputs.md          ← Input, Search, Dropdown/Filter
        └── data-display.md    ← Table, Card, Badge, Empty State
```

---

## Contributing

Have a new component or a fix? 

1. Create a branch: `git checkout -b update/component-name`
2. Make your changes
3. Update `CHANGELOG.md`
4. Open a PR → tag the design lead for review
5. Merge to `main` when approved
