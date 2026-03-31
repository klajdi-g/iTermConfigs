# iTerm Dotfiles Configuration

A minimal, nvim-inspired iTerm2 configuration with Rosé Pine theme, persistent sessions, and SketchyBar integration.

## Features

🎨 **Rosé Pine Theme** - Beautiful, eye-friendly color scheme
✨ **Minimal Aesthetic** - No borders, no buttons, no decorations (like nvim)
🔄 **Persistent Sessions** - 10 sessions (0-9) that persist across restarts
⌨️ **Session Shortcuts** - Cmd+Shift+T to create, Cmd+Shift+0-9 to switch
📊 **SketchyBar Widget** - Shows current iTerm session on your macOS bar

## Installation

### Quick Setup

```bash
cd ~/dotfiles/iterm
bash setup.sh
```

The setup script will:
- Backup your current iTerm configuration
- Download and install the Rosé Pine color scheme
- Configure minimal iTerm aesthetics
- Set up persistent sessions (0-9)
- Configure keybindings for session management

## Session Management

### Keybindings

| Shortcut | Action |
|----------|--------|
| `Cmd+Shift+T` | Create new session |
| `Cmd+Shift+0` | Switch to session 0 |
| `Cmd+Shift+1-9` | Switch to session 1-9 |

### Session Naming

Sessions are automatically named based on the running application:
- `nvim` - Vim/Neovim editor
- `zsh` - Shell
- `opencode` - OpenCode editor
- Or any other running app

## SketchyBar Integration

Once installed, your SketchyBar will display the current iTerm session:

```
opencode > zsh > nvim
         ▲ (highlighted in Iris color)
```

The widget:
- Shows all active sessions
- Highlights the current session
- Updates in real-time
- Hides when iTerm is not running

## Files

- `iterm/setup.sh` - Main installation script
- `iterm/rose-pine.itermcolors` - Rosé Pine color scheme
- `README.md` - This file

## Requirements

- macOS 10.14+
- iTerm2 3.4.0+
- SketchyBar (for session widget)

## License

MIT License
