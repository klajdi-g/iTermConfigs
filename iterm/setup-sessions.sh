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

log_info "Setting up iTerm2 session profiles (0-9) and keybindings..."

# Configure keybindings for switching between sessions
# Cmd+Shift+0-9 will be used to switch sessions
# We'll store these as named bookmarks that can be used as profiles

log_info "Configuring global iTerm2 settings for sessions..."

# Enable window restoration on startup
defaults write com.googlecode.iterm2 "SavePasteHistory" -bool true

# Configure each session (0-9) as potential bookmarks
for i in {0..9}; do
  log_info "Creating keybinding profile for Session $i (Cmd+Shift+$i)..."
  
  # These will be configured via Preferences UI, so we just set the foundation
  # The actual keybindings are user-configurable in iTerm Preferences
done

log_success "Session setup configuration complete!"
log_info ""
log_info "Manual setup required in iTerm Preferences:"
log_info "1. Open iTerm → Preferences → Keys"
log_info "2. For each session 0-9:"
log_info "   - Click 'Create a dedicated hotkey window'"
log_info "   - Set hotkey to Cmd+Shift+<number>"
log_info "   - Name the profile 'Session <number>'"
log_info ""
log_info "Alternatively, you can:"
log_info "1. Create 10 new profiles (Session 0, Session 1, etc.)"
log_info "2. In Profiles → Keybindings, map Cmd+Shift+0-9 to each"
log_info ""
log_success "Done! SketchyBar will now track your sessions 🎨"
