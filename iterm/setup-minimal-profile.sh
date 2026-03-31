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

log_info "Optimizing Default profile for ultra-minimal appearance..."

# Get the Default profile GUID
PROFILE_GUID=$(defaults read com.googlecode.iterm2 "New Bookmarks" 2>/dev/null | grep -A 1 "GUID" | grep -o "[0-9A-F]\{8\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{12\}" | head -1 || echo "Default")

log_info "Step 1: Configuring spacing and padding..."

# Minimize character spacing for compact look
defaults write com.googlecode.iterm2 "Profiles" -dict-add "Default" "{
  'Character Spacing' = '1.0';
  'Line Height' = '1.0';
  'Horizontal Spacing' = '1.0';
  'Vertical Spacing' = '1.0';
  'Use Bold Font' = '0';
  'Draw Bold Text in Bright Colors' = '0';
}"

log_success "Optimized character spacing"

log_info "Step 2: Ensuring background is solid (no image)..."

# Remove any background image
defaults write com.googlecode.iterm2 "Profiles" -dict-add "Default" "{
  'Background Image Location' = '';
  'Blending' = '0.5';
  'Background Image is Tiled' = '0';
}"

log_success "Configured solid background"

log_info "Step 3: Disabling visual indicators..."

# Disable all visual indicators and badges
defaults write com.googlecode.iterm2 "Profiles" -dict-add "Default" "{
  'Badge Max Width' = '0';
  'Badge Max Height' = '0';
  'Show Cursor Guide' = '0';
  'Enable OSC 8' = '0';
}"

log_success "Disabled visual indicators"

log_info "Step 4: Minimizing margins and padding..."

# Set minimal margins
defaults write com.googlecode.iterm2 "SideMargins" -int 0
defaults write com.googlecode.iterm2 "TopBottomMargins" -int 0

log_success "Minimized margins and padding"

log_info "========================================="
log_success "Profile optimization complete!"
log_info ""
log_info "After restarting iTerm2, your terminal will:"
log_info "• Have zero visible UI elements"
log_info "• Display only content (no tabs, borders, or decorations)"
log_info "• Use Ctrl+Shift+1-10 to switch sessions"
log_info "• Show sessions in SketchyBar widget"
log_info ""
log_success "Enjoy your ultra-minimal iTerm experience! 🎨"
