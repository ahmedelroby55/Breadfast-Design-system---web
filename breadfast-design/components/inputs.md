# Inputs

## Input Field

`border-radius: 8px`. Focus ring: `#AA0082`. Default border: `#D8D8D8`.

```tsx
<input style={{
  backgroundColor: '#FFFFFF', border: '1px solid #D8D8D8',
  borderRadius: '8px', padding: '10px 12px',
  color: '#212121', fontSize: '14px', outline: 'none',
  fontFamily: "'Work Sans', sans-serif", width: '100%',
}}
  onFocus={e => e.currentTarget.style.borderColor = '#AA0082'}
  onBlur={e => e.currentTarget.style.borderColor = '#D8D8D8'}
  placeholder="Placeholder"
/>
```

---

## Search Input (page-level filter)

Full-width, `38px` tall, `border-radius: 4px`, border `#EBEBEB`. Search icon on the right.

```tsx
import { SearchOutlined } from '@ant-design/icons';

<div style={{
  display: 'flex', alignItems: 'center', height: '38px', width: '100%',
  backgroundColor: '#FFFFFF', border: '1px solid #EBEBEB',
  borderRadius: '4px', padding: '0 16px', gap: '4px',
}}>
  <input type="text" placeholder="Search by product name or product ID" style={{
    flex: 1, border: 'none', outline: 'none',
    fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500, color: '#212121',
  }} />
  <SearchOutlined style={{ fontSize: 16, color: '#B7B7B7' }} />
</div>
```

---

## Dropdown / Filter Button

Custom bordered button with chevron. **Not a `<select>` element.**
Used for filters like "Select FP", "Product type", "Category".
Equal-width, laid out in a single row with `gap: 16px`.

```tsx
import { DownOutlined } from '@ant-design/icons';

<div style={{
  flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'space-between',
  padding: '12px', border: '1px solid #EBEBEB', borderRadius: '4px',
  cursor: 'pointer', backgroundColor: '#FFFFFF',
}}>
  <span style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500, color: '#B7B7B7' }}>
    Select FP
  </span>
  <DownOutlined style={{ fontSize: 12, color: '#B7B7B7' }} />
</div>
```

## Filter row layout (multiple dropdowns)

```tsx
<div style={{ display: 'flex', gap: '16px', width: '100%' }}>
  {/* Dropdown 1 */}
  <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '12px', border: '1px solid #EBEBEB', borderRadius: '4px', cursor: 'pointer', backgroundColor: '#FFFFFF' }}>
    <span style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500, color: '#B7B7B7' }}>Select FP</span>
    <DownOutlined style={{ fontSize: 12, color: '#B7B7B7' }} />
  </div>
  {/* Dropdown 2 */}
  <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '12px', border: '1px solid #EBEBEB', borderRadius: '4px', cursor: 'pointer', backgroundColor: '#FFFFFF' }}>
    <span style={{ fontFamily: "'Work Sans', sans-serif", fontSize: '14px', fontWeight: 500, color: '#B7B7B7' }}>Product type</span>
    <DownOutlined style={{ fontSize: 12, color: '#B7B7B7' }} />
  </div>
</div>
```
