#!/bin/bash

# Add Homebrew to PATH (needed for AeroSpace commands when run via launchctl)
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# If the focused workspace doesn't have an item in Sketchybar yet, create it dynamically
if ! sketchybar --query "space.$FOCUSED_WORKSPACE" >/dev/null 2>&1; then
  sketchybar --add item "space.$FOCUSED_WORKSPACE" left \
             --subscribe "space.$FOCUSED_WORKSPACE" aerospace_workspace_change \
             --set "space.$FOCUSED_WORKSPACE" \
                   icon="$FOCUSED_WORKSPACE" \
                   icon.padding_left=10 \
                   icon.padding_right=10 \
                   background.color=0x33ffffff \
                   background.corner_radius=5 \
                   background.height=26 \
                   background.drawing=off \
                   label.drawing=off \
                   click_script="aerospace workspace $FOCUSED_WORKSPACE" \
                   script="$CONFIG_DIR/plugins/aerospacer.sh $FOCUSED_WORKSPACE" \
             --move "space.$FOCUSED_WORKSPACE" before space_chevron
fi
