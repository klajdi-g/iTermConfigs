# iTerm Configuration

**Ultra-minimal** iTerm2 setup with Rosé Pine theme and persistent session management via SketchyBar.

## Philosophy

This configuration strips iTerm down to its essence: **just the terminal content**. No tabs. No bars. No borders. No decorations. Nothing but a clean, distraction-free terminal window.

## Quick Start

```bash
# Core minimal setup
bash setup.sh

# Optional: Profile optimization for maximum minimalism
bash setup-minimal-profile.sh
```

## Setup Steps

1. Run `setup.sh` (applies system-wide iTerm2 settings)
2. Optionally run `setup-minimal-profile.sh` (further optimizes Default profile)
3. Restart iTerm2
4. Go to Preferences → Profiles → Colors → Color Presets → **Rosé Pine**
5. Sessions will now appear in your SketchyBar widget

## What You Get

- ✅ **Zero UI elements** - tabs, title bar, scrollbars, borders all hidden
- ✅ **Content-focused** - only your terminal content is visible
- ✅ **Keyboard-driven** - use hotkeys to manage sessions
- ✅ **SketchyBar integration** - session display in your top bar
- ✅ **Borderless appearance** - seamless window integration

## Session Management

All session switching is keyboard-driven via hotkey windows. Sessions display in your SketchyBar widget.

### Keyboard Shortcuts

Use these to manage sessions:
- `Ctrl+Shift+T` - Create a new session
- `Ctrl+Shift+1-10` - Switch to session 1-10

**Setup Instructions:**
1. iTerm Preferences → Keys
2. Click "Create a dedicated hotkey window"
3. Set hotkey to `Ctrl+Shift+<number>`
4. Name the profile `Session <number>`
5. Repeat for 0-10

## Configuration Details

### Global Settings Applied
- Tab bar completely hidden
- Title bar hidden
- All scrollbars hidden
- Window borders removed
- Visual bells disabled
- Minimal appearance mode enabled
- Transparency disabled

### Profile Optimization (Optional)
The `setup-minimal-profile.sh` script further optimizes the Default profile:
- Character spacing minimized (1.0x)
- Line height tightened (1.0x)
- All visual indicators disabled
- Margins and padding reduced to zero
- Background image removed (solid color only)

## Appearance Notes

- **macOS window buttons** (close, minimize, zoom): These are system controls and cannot be hidden via iTerm settings. They're part of standard macOS window chrome. They will auto-hide in fullscreen mode.
- **Font**: JetBrainsMono Nerd Font 12pt (configured automatically)
- **Theme**: Rosé Pine (manually select in Preferences after setup)
- **Color scheme**: Matches SketchyBar color definitions for visual consistency
