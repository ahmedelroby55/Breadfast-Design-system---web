# Buttons

`border-radius: 4px` always — never 8px or 12px on buttons.
Font: Work Sans SemiBold 14px. Icon-label gap: `8px`. Icon size: `20px`.

```tsx
interface ButtonProps {
  label: string;
  icon?: React.ReactNode;
  onClick?: () => void;
  disabled?: boolean;
}

// Primary — filled magenta
export function PrimaryButton({ label, icon, onClick, disabled }: ButtonProps) {
  return (
    <button onClick={onClick} disabled={disabled} style={{
      display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
      gap: '8px', padding: '12px', borderRadius: '4px', border: 'none',
      backgroundColor: disabled ? '#D8D8D8' : '#AA0082',
      color: '#FFFFFF', fontFamily: "'Work Sans', sans-serif",
      fontWeight: 600, fontSize: '14px', lineHeight: '20px',
      whiteSpace: 'nowrap', cursor: disabled ? 'not-allowed' : 'pointer',
      transition: 'background-color 0.15s ease',
    }}
      onMouseEnter={e => { if (!disabled) e.currentTarget.style.backgroundColor = '#9C0062'; }}
      onMouseLeave={e => { if (!disabled) e.currentTarget.style.backgroundColor = '#AA0082'; }}
    >
      {icon && <span style={{ width: 20, height: 20, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>{icon}</span>}
      {label}
    </button>
  );
}

// Secondary — outlined
export function SecondaryButton({ label, icon, onClick, disabled }: ButtonProps) {
  return (
    <button onClick={onClick} disabled={disabled} style={{
      display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
      gap: '8px', padding: '12px', borderRadius: '4px', border: '1px solid #AA0082',
      backgroundColor: disabled ? '#F3F4F5' : '#FFF0F7',
      color: disabled ? '#6F6F6F' : '#AA0082',
      fontFamily: "'Work Sans', sans-serif", fontWeight: 600, fontSize: '14px',
      lineHeight: '20px', whiteSpace: 'nowrap', cursor: disabled ? 'not-allowed' : 'pointer',
      transition: 'background-color 0.15s ease',
    }}
      onMouseEnter={e => { if (!disabled) e.currentTarget.style.backgroundColor = '#FFD6E8'; }}
      onMouseLeave={e => { if (!disabled) e.currentTarget.style.backgroundColor = '#FFF0F7'; }}
    >
      {icon && <span style={{ width: 20, height: 20, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>{icon}</span>}
      {label}
    </button>
  );
}

// Text — no background
export function TextButton({ label, icon, onClick, disabled }: ButtonProps) {
  return (
    <button onClick={onClick} disabled={disabled} style={{
      display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
      gap: '8px', padding: '12px', borderRadius: '4px', border: 'none',
      backgroundColor: 'transparent', color: disabled ? '#6F6F6F' : '#AA0082',
      fontFamily: "'Work Sans', sans-serif", fontWeight: 600, fontSize: '14px',
      lineHeight: '20px', whiteSpace: 'nowrap', cursor: disabled ? 'not-allowed' : 'pointer',
    }}
      onMouseEnter={e => { if (!disabled) e.currentTarget.style.backgroundColor = '#FFF0F7'; }}
      onMouseLeave={e => { if (!disabled) e.currentTarget.style.backgroundColor = 'transparent'; }}
    >
      {icon && <span style={{ width: 20, height: 20, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>{icon}</span>}
      {label}
    </button>
  );
}
```

## Usage example

```tsx
import { PlusOutlined } from '@ant-design/icons';

<PrimaryButton label="Add product" icon={<PlusOutlined style={{ fontSize: 20 }} />} onClick={handleAdd} />
<SecondaryButton label="Export" icon={<DownloadOutlined style={{ fontSize: 20 }} />} onClick={handleExport} />
<TextButton label="Cancel" onClick={handleCancel} />
```
