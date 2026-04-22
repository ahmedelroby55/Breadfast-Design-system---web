---
name: breadfast-design-v1.2
description: >
  Apply Breadfast's brand identity and design tokens when building any UI, prototype, feature, or React component.
  ALWAYS use this skill whenever the user asks to: build a UI, create a prototype, add a new feature, create a component,
  design a page, build a screen, or produce any visual output in React. This ensures every output matches Breadfast's
  corporate/enterprise visual style — not generic or system defaults. Trigger on any request involving UI creation,
  prototyping, feature design, component building, or visual layout in a React codebase.
---

# Breadfast Design Identity Skill — V1.2

Use this skill every time you build UI, prototypes, new features, or React components for Breadfast. Never use generic system defaults, Tailwind's default palette, or plain browser styles.

---

## ⚡ Step 1 — Always Ask This First

Before writing any code, send this message:

> "Before I start — should this screen include the Breadfast admin panel navigation bar?"
> - **Yes** → ask in the same message: "Which section does this page belong to? And what's the exact page name?"
> - **No** → proceed without it

**Rules:**
- Never skip this, even if the user didn't mention the nav bar
- Ask both questions in one message — don't split into two turns
- Map the answer to `activeKey` (route) and `openKey` (submenu) from the NAV_ITEMS table in `components/nav-bar.md`
- If the user already mentioned a section/page, confirm before building — don't assume

---

## Step 2 — Load Component Files

Before building, read every component file that's relevant to the task:

| File | What's inside | When to read |
|---|---|---|
| `components/nav-bar.md` | AdminNav, NAV_ITEMS, App Shell | Any screen with the nav bar |
| `components/buttons.md` | Primary, Secondary, Text buttons | Any screen with actions |
| `components/inputs.md` | Input, Search, Dropdown/Filter | Any screen with filters or forms |
| `components/data-display.md` | Table, Card, Badge, Empty State | Any screen showing data |

> For a full page with nav + filters + table, read all four files before writing any code.

---

## 2 — Brand Identity

| | |
|---|---|
| **Product** | Breadfast — corporate/enterprise internal platform |
| **Style** | Clean, structured, professional. Generous whitespace. Subtle borders. No heavy shadows. |
| **Primary color** | Magenta `#AA0082` — buttons, active states, links, focus rings |
| **Font** | Work Sans — always, no exceptions |
| **Backgrounds** | `#F3F4F5` app shell · `#FFFFFF` cards and content areas |
| **Borders** | `#EBEBEB` default · `#D8D8D8` on grey backgrounds |

---

## 3 — Typography

**Font: Work Sans** — import via Google Fonts:

```html
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
```

| Role | Size | Weight | Color |
|---|---|---|---|
| Page title / H1 | 24px | 700 | `#212121` |
| Section heading / H2 | 20px | 600 | `#212121` |
| Card heading / H3 | 16px | 600 | `#212121` |
| Body text | 14px | 400 | `#212121` |
| Label (form) | 14px | 500 | `#212121` |
| Caption / helper | 12px | 400 | `#6F6F6F` |
| Disabled text | any | 400 | `#B7B7B7` |
| Link / interactive | 14px | 500 | `#AA0082` |

---

## 4 — Color Tokens

### Backgrounds
| Token | Hex | Usage |
|---|---|---|
| `bg-default` | `#FFFFFF` | Page/card backgrounds |
| `bg-secondary` | `#F3F4F5` | App shell, table rows, secondary surfaces |
| `bg-tertiary` | `#EBEBEB` | Dividers, skeleton loaders, hover fills |
| `bg-brand` | `#FFF0F7` | Brand-tinted backgrounds, selected highlights |
| `bg-success` | `#E8FFED` | Success banners |
| `bg-warning` | `#FFF2E8` | Warning banners |
| `bg-error` | `#FFF1F1` | Error banners |
| `bg-progress` | `#EDF5FF` | Info/progress banners |
| `bg-highlight` | `#FCF4D6` | Highlighted content |
| `bg-premium` | `#D9FBFB` | Premium features |
| `bg-overlay` | `rgba(33,33,33,0.5)` | Modal overlays |

### Text
| Token | Hex | Usage |
|---|---|---|
| `text-default` | `#212121` | Body text, labels, headings |
| `text-secondary` | `#6F6F6F` | Captions, helper text, metadata |
| `text-tertiary` | `#B7B7B7` | Placeholder text, disabled labels |
| `text-inverse` | `#FFFFFF` | Text on dark/brand backgrounds |
| `text-brand` | `#AA0082` | Clickable text, links |
| `text-success` | `#108723` | Success messages |
| `text-warning` | `#BA4E00` | Warning messages |
| `text-error` | `#DA1E28` | Error messages, validation |
| `text-progress` | `#0F62FE` | Info/link text |
| `text-highlight` | `#8E6A00` | Highlighted labels |
| `text-premium` | `#088A86` | Premium labels |

### Brand Scale (Magenta)
| Token | Hex |
|---|---|
| `brand-lightest` | `#FFF0F7` |
| `brand-lighter` | `#FFD6E8` |
| `brand-light` | `#FBB3E1` |
| `brand-primary` | `#AA0082` ← **main** |
| `brand-dark` | `#9C0062` |
| `brand-darker` | `#7C0E52` |
| `brand-coffee` | `#5C0058` |

### Borders
| Token | Hex | Usage |
|---|---|---|
| `border-default` | `#EBEBEB` | Default border on white |
| `border-secondary` | `#D8D8D8` | Border on grey backgrounds |
| `border-brand` | `#AA0082` | Focus ring, selected state |
| `border-error` | `#DA1E28` | Input error |
| `border-success` | `#108723` | Input success |
| `border-warning` | `#BA4E00` | Input warning |
| `border-progress` | `#0F62FE` | Input info |

### Icons
| Token | Hex |
|---|---|
| `icon-default` | `#212121` |
| `icon-secondary` | `#B7B7B7` |
| `icon-inverse` | `#FFFFFF` |
| `icon-success` | `#108723` |
| `icon-warning` | `#BA4E00` |
| `icon-error` | `#DA1E28` |
| `icon-progress` | `#0F62FE` |

### Status (badges, tags, filled states)
| Token | Hex |
|---|---|
| `heavy-brand` | `#AA0082` |
| `heavy-success` | `#108723` |
| `heavy-warning` | `#EB6200` |
| `heavy-error` | `#DA1E28` |
| `heavy-progress` | `#0F62FE` |
| `heavy-premium` | `#088A86` |
| `heavy-dark-grey` | `#212121` |

### Interaction States
| Token | Hex | Usage |
|---|---|---|
| `interaction-primary-default` | `#AA0082` | Primary button fill |
| `interaction-primary-hover` | `#9C0062` | Primary button hover |
| `interaction-primary-disabled` | `#D8D8D8` | Disabled button |
| `interaction-secondary-default` | `#FFF0F7` | Secondary button fill |
| `interaction-secondary-hover` | `#FFD6E8` | Secondary button hover |
| `interaction-text-default` | `#AA0082` | Text button / link |
| `interaction-text-hover` | `#9C0062` | Text button hover |
| `interaction-text-disabled` | `#6F6F6F` | Disabled text button |

---

## 5 — Spacing, Radius & Borders

### Spacing Scale
| Token | Value |
|---|---|
| `spacing-4` | 4px |
| `spacing-8` | 8px |
| `spacing-12` | 12px |
| `spacing-16` | 16px |
| `spacing-24` | 24px |
| `spacing-32` | 32px |
| `spacing-40` | 40px |
| `spacing-48` | 48px |
| `spacing-56` | 56px |
| `spacing-64` | 64px |

### Border Radius
| Token | Value | Use |
|---|---|---|
| `radius-none` | 0px | Tables, flush elements |
| `radius-sm` | 4px | **Buttons**, badges, tags |
| `radius-md` | 8px | Inputs, small cards |
| `radius-lg` | 12px | Cards, panels, modals |
| `radius-xl` | 16px | Large cards, sheets |
| `radius-2xl` | 32px | Floating elements |
| `radius-3xl` | 128px | Pill shapes |
| `radius-4xl` | 360px | Avatars, icon buttons |

### Border Weight
| Token | Value |
|---|---|
| `border-weight-sm` | 1px ← **default** |
| `border-weight-md` | 1.25px |
| `border-weight-lg` | 2px |

---

## 6 — Icons (Ant Design)

**Only Ant Design Icons.** Never use emoji, inline SVGs, or other libraries unless explicitly asked.

```bash
npm install @ant-design/icons
```

Always import individually:
```tsx
import { SearchOutlined, PlusOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons';
```

### Sizing by context
| Context | Style |
|---|---|
| Nav bar icons | `style={{ fontSize: 16, color: '#B7B7B7' }}` |
| Button icons | `style={{ fontSize: 20 }}` (inherits button color) |
| Table action icons | `style={{ fontSize: 16, color: '#6F6F6F' }}` |
| Status icons | `style={{ fontSize: 16 }}` (use semantic color) |
| Empty state icons | `style={{ fontSize: 48, color: '#B7B7B7' }}` |

### Common icon map
| UI Context | Ant Icon |
|---|---|
| Search | `<SearchOutlined />` |
| Add / Create | `<PlusOutlined />` |
| Edit | `<EditOutlined />` |
| Delete | `<DeleteOutlined />` |
| Upload | `<UploadOutlined />` |
| Download | `<DownloadOutlined />` |
| Filter | `<FilterOutlined />` |
| Settings | `<SettingOutlined />` |
| Close | `<CloseOutlined />` |
| Confirm | `<CheckOutlined />` |
| Warning | `<ExclamationCircleOutlined />` |
| Error | `<CloseCircleOutlined />` |
| Success | `<CheckCircleOutlined />` |
| Info | `<InfoCircleOutlined />` |
| Chevron down | `<DownOutlined />` |
| Chevron up | `<UpOutlined />` |
| Chevron right | `<RightOutlined />` |
| Back | `<ArrowLeftOutlined />` |
| Refresh | `<ReloadOutlined />` |
| More actions | `<MoreOutlined />` |
| Calendar | `<CalendarOutlined />` |
| User / Profile | `<UserOutlined />` |
| Pricing / Tag | `<TagOutlined />` |
| Empty state | `<InboxOutlined />` |

---

## 7 — CSS Variables

Add at the top of every component or global stylesheet:

```css
:root {
  --bg-default: #FFFFFF;
  --bg-secondary: #F3F4F5;
  --bg-tertiary: #EBEBEB;
  --bg-brand: #FFF0F7;
  --bg-success: #E8FFED;
  --bg-warning: #FFF2E8;
  --bg-error: #FFF1F1;
  --bg-progress: #EDF5FF;

  --text-default: #212121;
  --text-secondary: #6F6F6F;
  --text-tertiary: #B7B7B7;
  --text-inverse: #FFFFFF;
  --text-success: #108723;
  --text-warning: #BA4E00;
  --text-error: #DA1E28;
  --text-progress: #0F62FE;
  --text-brand: #AA0082;

  --brand-primary: #AA0082;
  --brand-dark: #9C0062;
  --brand-lighter: #FFD6E8;
  --brand-lightest: #FFF0F7;

  --border-default: #EBEBEB;
  --border-secondary: #D8D8D8;
  --border-brand: #AA0082;
  --border-error: #DA1E28;

  --icon-default: #212121;
  --icon-secondary: #B7B7B7;
}
```

---

## 8 — Do's and Don'ts

> For a full history of changes, see `CHANGELOG.md`.



**DO:**
- Use `#AA0082` as the primary action color — buttons, links, focus rings
- Use `#F3F4F5` for app shell background, `#FFFFFF` for card/content surfaces
- Use `#EBEBEB` for all dividers and borders in default state
- Use `border-radius: 4px` for buttons, `8px` for inputs, `12px` for cards
- Keep layouts spacious — 24px or 32px padding inside cards
- Use semantic background colors for status states
- Always read the relevant component file before building

**DON'T:**
- Don't use Tailwind's default blue (`#3B82F6`) or indigo as primary
- Don't add heavy box shadows — at most `box-shadow: 0 1px 3px rgba(0,0,0,0.08)`
- Don't use `border-radius` above `4px` on buttons
- Don't use `#000000` for body text — always `#212121`
- Don't invent colors outside the token set
- Don't use emoji or inline SVGs for icons — always Ant Design Icons
