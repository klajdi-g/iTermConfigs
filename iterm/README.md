# iTerm Configuration

Minimal iTerm2 setup with Rosé Pine theme and persistent session management.

## Quick Start

```bash
bash setup.sh
```

## Setup Steps

1. Run `setup.sh`
2. Restart iTerm2
3. Go to Preferences → Profiles → Colors → Color Presets → Rosé Pine

## Session Management

Sessions are managed via SketchyBar widget integration. Your current session displays in the SketchyBar with app names and highlighting.

### Creating and Switching Sessions

Use these keyboard shortcuts:
- `Option+Shift+0-9` - Switch to session 0-9

**Note:** Configure these in iTerm Preferences → Keys → Hotkey Windows

## Window Appearance

The setup minimizes iTerm's UI:
- No tab bar
- No title bar
- No scrollbars
- Minimal window styling

**Note:** macOS window buttons (close, minimize, zoom) cannot be hidden via defaults. These are part of the standard macOS window chrome and only hide when in fullscreen or when using app-specific theme customizations through iTerm's Advanced settings.

## Troubleshooting

- If theme doesn't apply, manually select it in iTerm Preferences
- Restart iTerm2 after running setup.sh
- Check SketchyBar widget is loading correctly
