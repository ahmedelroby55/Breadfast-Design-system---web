# Admin Panel Navigation Bar

The real Breadfast admin nav bar from the live product. Always use this exact structure, icons, and style. Never invent nav items or use different icons.

## Specs

- Background: `#050625` (dark navy), width `208px`, full height
- Logo: Breadfast SVG + "Breadfast" (SemiBold 12px) + "Admin panel" (Regular 13px), both white
- Search: black `#000000` background, `border-radius: 8px`, placeholder "Search Page"
- Nav: Ant Design `<Menu theme="dark" mode="inline">`
- All items: `padding-left: 24px`
- Active item: `background: #AA0082`, text white, no border-radius

---

## NAV_ITEMS — complete list

```tsx
import {
  MessageOutlined, LineChartOutlined, ShopOutlined, AppstoreOutlined,
  StockOutlined, TableOutlined, ShoppingCartOutlined, TagsOutlined,
  TrophyOutlined, ShoppingOutlined, ExceptionOutlined, ReconciliationOutlined,
  NotificationOutlined, DollarCircleOutlined, PercentageOutlined,
  UserDeleteOutlined, BookOutlined, RetweetOutlined, UnorderedListOutlined,
  BugOutlined, GiftOutlined, SearchOutlined, CopyrightOutlined,
} from '@ant-design/icons';
import { Menu } from 'antd';

const NAV_ITEMS = [
  { type: 'submenu', key: 'open-interactions',         label: 'Open Interactions',               icon: <MessageOutlined /> },
  { type: 'submenu', key: 'analytics',                 label: 'Analytics',                       icon: <LineChartOutlined /> },
  { type: 'submenu', key: 'facilities',                label: 'Facilities',                      icon: <ShopOutlined /> },
  { type: 'item',    key: '/campaigns',                label: 'Auto Discounts',                  icon: <AppstoreOutlined /> },
  { type: 'item',    key: '/fps-x-ray',                label: 'FPs X-ray',                       icon: <StockOutlined /> },
  { type: 'submenu', key: 'constraint-management',     label: 'Constraint Management',           icon: <AppstoreOutlined /> },
  { type: 'submenu', key: 'planning-center',           label: 'Planning Center',                 icon: <TableOutlined /> },
  { type: 'submenu', key: 'inventory-management',      label: 'Inventory Management',            icon: <ShoppingCartOutlined /> },
  { type: 'submenu', key: 'coupons',                   label: 'Coupons',                         icon: <TagsOutlined /> },
  { type: 'item',    key: '/breadfast_rewards',        label: 'Breadfast Rewards',               icon: <TrophyOutlined /> },
  { type: 'submenu', key: 'operations-communications', label: 'Operations Communications Center', icon: <MessageOutlined /> },
  { type: 'item',    key: '/order-rating-reasons',     label: 'Order Rating Reasons',            icon: <ShoppingOutlined /> },
  { type: 'item',    key: '/cancellation-reasons',     label: 'Cancellation Reasons',            icon: <ExceptionOutlined /> },
  { type: 'item',    key: '/collections',              label: 'Collections',                     icon: <TableOutlined /> },
  { type: 'submenu', key: 'sms',                       label: 'SMS',                             icon: <TableOutlined /> },
  { type: 'item',    key: '/recommendations',          label: 'Recommendations',                 icon: <ReconciliationOutlined /> },
  { type: 'submenu', key: 'app-communications',        label: 'App Communications',              icon: <NotificationOutlined /> },
  { type: 'submenu', key: 'banners',                   label: 'Banners',                         icon: <TagsOutlined /> },
  { type: 'submenu', key: 'cash-collection',           label: 'Cash Collection',                 icon: <DollarCircleOutlined /> },
  { type: 'item',    key: '/bulk-discounts',           label: 'Bulk Discounts',                  icon: <PercentageOutlined /> },
  { type: 'item',    key: '/deleted-users-logs',       label: 'Deleted Users Logs',              icon: <UserDeleteOutlined /> },
  { type: 'submenu', key: 'odoo',                      label: 'Odoo',                            icon: <BookOutlined /> },
  { type: 'item',    key: '/orders',                   label: 'Orders',                          icon: <ShopOutlined /> },
  { type: 'item',    key: '/smart-lists',              label: 'Smart Lists',                     icon: <ShopOutlined /> },
  { type: 'item',    key: 'search-boosts',             label: 'Search Rules',                    icon: <SearchOutlined /> },
  { type: 'item',    key: '/pricing-tool',             label: 'Pricing Tool',                    icon: <DollarCircleOutlined /> },
  { type: 'submenu', key: 'operation',                 label: 'Operation',                       icon: <ShopOutlined /> },
  { type: 'item',    key: '/dcm',                      label: 'DCM',                             icon: <AppstoreOutlined /> },
  { type: 'submenu', key: 'mid-mile',                  label: 'Mid-mile',                        icon: <AppstoreOutlined /> },
  { type: 'item',    key: '/sales-engine',             label: 'Sales Engine',                    icon: <PercentageOutlined /> },
  { type: 'submenu', key: 'bf-shops',                  label: 'BF Shops',                        icon: <AppstoreOutlined /> },
  { type: 'item',    key: '/kds-stations',             label: 'KDS Stations',                    icon: <AppstoreOutlined /> },
  { type: 'submenu', key: 'catalog',                   label: 'Catalog',                         icon: <CopyrightOutlined /> },
  { type: 'item',    key: '/daLiveTracking',           label: 'DA Live Tracking',                icon: <AppstoreOutlined /> },
  { type: 'submenu', key: 'das-incentives',            label: 'DAs Incentives',                  icon: <AppstoreOutlined /> },
  { type: 'item',    key: '/alternatives',             label: 'Alternatives',                    icon: <RetweetOutlined /> },
  { type: 'submenu', key: 'bundleup',                  label: 'BundleUp',                        icon: <UnorderedListOutlined /> },
  { type: 'item',    key: '/support-bugs',             label: 'Support Bugs',                    icon: <BugOutlined /> },
  { type: 'submenu', key: 'gifting',                   label: 'Gifting',                         icon: <GiftOutlined /> },
  { type: 'submenu', key: 'pricing',                   label: 'Pricing',                         icon: <DollarCircleOutlined /> },
];
```

---

## AdminNav Component

```tsx
export function AdminNav({ activeKey, openKey, items }: {
  activeKey: string;   // e.g. '/pricing-tool'
  openKey: string;     // e.g. 'pricing'
  items: typeof NAV_ITEMS;
}) {
  return (
    <aside style={{
      width: '208px', minHeight: '100vh', backgroundColor: '#050625',
      flexShrink: 0, display: 'flex', flexDirection: 'column',
      fontFamily: "'Work Sans', sans-serif", overflowY: 'auto',
    }}>
      {/* Logo */}
      <div style={{ padding: '16px 24px 8px', display: 'flex', alignItems: 'center', gap: '8px' }}>
        <div style={{ width: '18px', height: '34px', flexShrink: 0 }} /> {/* Replace with Breadfast SVG */}
        <div>
          <div style={{ color: '#FFFFFF', fontSize: '12px', fontWeight: 600, lineHeight: '21px' }}>Breadfast</div>
          <div style={{ color: '#FFFFFF', fontSize: '13px', fontWeight: 400, lineHeight: '22px' }}>Admin panel</div>
        </div>
      </div>
      {/* Search */}
      <div style={{ padding: '0 8px 8px' }}>
        <input type="search" placeholder="Search Page" style={{
          width: '100%', backgroundColor: '#000000', border: 'none',
          borderRadius: '8px', padding: '8px 12px',
          color: '#B7B7B7', fontSize: '12px', outline: 'none',
        }} />
      </div>
      {/* Nav */}
      <Menu
        theme="dark" mode="inline"
        selectedKeys={[activeKey]} defaultOpenKeys={[openKey]}
        style={{ backgroundColor: '#050625', borderRight: 'none', flex: 1 }}
        items={items.map(item =>
          item.type === 'submenu'
            ? { key: item.key, icon: item.icon, label: item.label, children: [] }
            : { key: item.key, icon: item.icon, label: item.label }
        )}
      />
    </aside>
  );
}
```

---

## Full App Shell

```tsx
<div style={{ display: 'flex', minHeight: '100vh', fontFamily: "'Work Sans', sans-serif" }}>
  <AdminNav activeKey="/pricing-tool" openKey="pricing" items={NAV_ITEMS} />
  <main style={{ flex: 1, display: 'flex', flexDirection: 'column', backgroundColor: '#FFFFFF', overflow: 'hidden' }}>
    {/* Top bar */}
    <div style={{ height: '45px', borderBottom: '1px solid #EBEBEB', display: 'flex', alignItems: 'center', justifyContent: 'flex-end', padding: '0 16px' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '8px', padding: '4px 8px', border: '1px solid #D9D9D9', borderRadius: '2px', cursor: 'pointer' }}>
        <span style={{ color: '#212121', fontSize: '14px', fontWeight: 500 }}>Hello, User Name</span>
      </div>
    </div>
    {/* Page content */}
    <div style={{ flex: 1, overflow: 'auto', padding: '16px' }}>
      {/* content here */}
    </div>
  </main>
</div>
```

> Map the user's answer to `activeKey` (route, e.g. `/pricing-tool`) and `openKey` (submenu, e.g. `pricing`) using NAV_ITEMS above.
