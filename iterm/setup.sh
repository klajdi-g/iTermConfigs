#!/bin/bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }

ITERM_SUPPORT_DIR="$HOME/Library/Application Support/iTerm2"
ITERM_COLORSCHEMES_DIR="$ITERM_SUPPORT_DIR/ColorSchemes"
BACKUP_DIR="$ITERM_SUPPORT_DIR/backup-$(date +%s)"

log_info "iTerm2 Minimal Configuration Setup"
log_info "===================================="

# Step 1: Backup existing config
log_info "Step 1: Backing up existing iTerm configuration..."
mkdir -p "$BACKUP_DIR"
if [ -f "$ITERM_SUPPORT_DIR/com.googlecode.iterm2.plist" ]; then
    cp "$ITERM_SUPPORT_DIR/com.googlecode.iterm2.plist" "$BACKUP_DIR/"
    log_success "Backed up to: $BACKUP_DIR"
else
    log_warn "No existing iTerm config found to backup"
fi

# Step 2: Create ColorSchemes directory
log_info "Step 2: Creating ColorSchemes directory..."
mkdir -p "$ITERM_COLORSCHEMES_DIR"
log_success "Created $ITERM_COLORSCHEMES_DIR"

# Step 3: Download Rosé Pine theme
log_info "Step 3: Downloading Rosé Pine iTerm theme..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/rose-pine.itermcolors" ]; then
    cp "$SCRIPT_DIR/rose-pine.itermcolors" "$ITERM_COLORSCHEMES_DIR/"
    log_success "Copied Rosé Pine theme"
else
    log_info "Downloading from GitHub..."
    curl -fsSL "https://raw.githubusercontent.com/rose-pine/iterm/main/rose-pine.itermcolors" \
         -o "$ITERM_COLORSCHEMES_DIR/rose-pine.itermcolors"
    log_success "Downloaded Rosé Pine theme"
fi

# Step 4: Configure iTerm defaults
log_info "Step 4: Configuring iTerm2 settings..."

# General appearance
defaults write com.googlecode.iterm2 "Show tab bar" -bool false
defaults write com.googlecode.iterm2 "Hide tab abbreviation" -bool true
defaults write com.googlecode.iterm2 "Tab Style" -int 0

# Hide title bar and all window decorations
defaults write com.googlecode.iterm2 "HideTitle" -bool true
defaults write com.googlecode.iterm2 "HideToolbars" -bool true

# Hide all window buttons and decorations
defaults write com.googlecode.iterm2 "Use compact appearance" -bool true
defaults write com.googlecode.iterm2 "Minimal appearance" -bool true

# Minimal window
defaults write com.googlecode.iterm2 "Hide scrollbars" -bool true
defaults write com.googlecode.iterm2 "Disable transparency" -bool false

# Remove window buttons
defaults write com.googlecode.iterm2 "Show window border" -bool false

# Font settings
defaults write com.googlecode.iterm2 "Normal Font" -string "JetBrainsMono Nerd Font 12"
defaults write com.googlecode.iterm2 "Non Ascii Font" -string "JetBrainsMono Nerd Font 12"

# Terminal behavior
defaults write com.googlecode.iterm2 "Default Escape Time" -int 0
defaults write com.googlecode.iterm2 "Escape Time" -int 0

# Session behavior
defaults write com.googlecode.iterm2 "Opening Session with Tab Configuration" -int 1
defaults write com.googlecode.iterm2 "Automatically Open Windows and Tabs" -bool true

# Disable native fullscreen (works better with Aerospace)
defaults write com.googlecode.iterm2 "Use Lion Style Fullscreen" -bool false

log_success "Configured iTerm2 settings"

# Step 5: Complete
log_info "===================================="
log_success "iTerm setup complete!"
log_info ""
log_info "Next steps:"
log_info "1. Restart iTerm2"
log_info "2. Go to Preferences → Profiles → Colors → Color Presets"
log_info "3. Select 'Rosé Pine'"
log_info "4. Your SketchyBar widget will now show iTerm sessions"
log_info ""
log_success "Done! Enjoy your minimal iTerm setup 🎨"

# Step 5: Additional window decoration removal
log_info "Step 5: Removing all window decorations..."

# Disable window buttons and controls
defaults write com.googlecode.iterm2 "HideToolbars" -bool true
defaults write com.googlecode.iterm2 "ShowWindowBorder" -bool false

# Remove buttons from profile
defaults write com.googlecode.iterm2 "Show window border" -bool false

# Set profile to minimal
defaults write com.googlecode.iterm2 "Default Window Style" -int 0

# Disable focus follows mouse and other visual elements
defaults write com.googlecode.iterm2 "FocusFollowsMouse" -bool false

log_success "Window decorations removed"
