# Data Display

## Card

`border-radius: 12px`. Border `#EBEBEB`. No box shadows.

```tsx
<div style={{
  backgroundColor: '#FFFFFF', border: '1px solid #EBEBEB',
  borderRadius: '12px', padding: '24px',
}}>
  {/* content */}
</div>
```

---

## Data Table

Headers: `48px` tall. Cells: `68px` tall. Dividers: `border-bottom: 1px solid #EBEBEB`. No horizontal borders between columns.

```tsx
{/* Header cell */}
<div style={{
  height: '48px', padding: '0 16px', display: 'flex', alignItems: 'center',
  borderBottom: '1px solid #EBEBEB', backgroundColor: '#FFFFFF',
}}>
  <span style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 600, color: '#212121' }}>
    Column name
  </span>
</div>

{/* Data cell — primary + secondary text */}
<div style={{
  height: '68px', padding: '14px 16px',
  display: 'flex', flexDirection: 'column', justifyContent: 'center',
  borderBottom: '1px solid #EBEBEB',
}}>
  <span style={{ fontSize: '14px', fontWeight: 500, color: '#212121', lineHeight: '16px' }}>Primary text</span>
  <span style={{ fontSize: '14px', fontWeight: 400, color: '#6F6F6F', lineHeight: '16px', marginTop: '8px' }}>Secondary text</span>
</div>

{/* Data cell — actions */}
<div style={{
  height: '68px', padding: '0 16px',
  display: 'flex', alignItems: 'center', gap: '8px',
  borderBottom: '1px solid #EBEBEB',
}}>
  <EditOutlined style={{ fontSize: 16, color: '#6F6F6F', cursor: 'pointer' }} />
  <DeleteOutlined style={{ fontSize: 16, color: '#DA1E28', cursor: 'pointer' }} />
</div>
```

---

## Status Badge

`border-radius: 4px`. Font: 12px, weight 500.

```tsx
// Success
<span style={{ backgroundColor: '#E8FFED', color: '#108723', borderRadius: '4px', padding: '2px 8px', fontSize: '12px', fontWeight: 500 }}>
  Success
</span>

// Warning
<span style={{ backgroundColor: '#FFF2E8', color: '#BA4E00', borderRadius: '4px', padding: '2px 8px', fontSize: '12px', fontWeight: 500 }}>
  Warning
</span>

// Error
<span style={{ backgroundColor: '#FFF1F1', color: '#DA1E28', borderRadius: '4px', padding: '2px 8px', fontSize: '12px', fontWeight: 500 }}>
  Error
</span>

// Info / Progress
<span style={{ backgroundColor: '#EDF5FF', color: '#0F62FE', borderRadius: '4px', padding: '2px 8px', fontSize: '12px', fontWeight: 500 }}>
  In progress
</span>

// Brand / Active
<span style={{ backgroundColor: '#FFF0F7', color: '#AA0082', borderRadius: '4px', padding: '2px 8px', fontSize: '12px', fontWeight: 500 }}>
  Active
</span>
```

---

## Empty State

Center vertically and horizontally. Icon + bold label + secondary description.
Always explain why it's empty and what the user should do next.

```tsx
import { InboxOutlined } from '@ant-design/icons';

<div style={{
  display: 'flex', flexDirection: 'column', alignItems: 'center',
  justifyContent: 'center', gap: '8px', padding: '80px 0',
}}>
  <InboxOutlined style={{ fontSize: 48, color: '#B7B7B7' }} />
  <p style={{
    fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500,
    color: '#212121', textAlign: 'center', margin: 0,
  }}>
    No data found
  </p>
  <p style={{
    fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 400,
    color: '#6F6F6F', textAlign: 'center', margin: 0,
  }}>
    Filter or search to view results
  </p>
</div>
```

### Empty state with scheduled content

```tsx
<div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: '8px', padding: '80px 0' }}>
  <CalendarOutlined style={{ fontSize: 48, color: '#B7B7B7' }} />
  <p style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500, color: '#212121', textAlign: 'center', margin: 0 }}>
    Discount starts Dec 17
  </p>
  <p style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 400, color: '#6F6F6F', textAlign: 'center', margin: 0 }}>
    Results will appear here once it starts.
  </p>
</div>
```
