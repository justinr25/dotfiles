#!/bin/bash

# Add Homebrew to PATH (needed for AeroSpace commands when run via launchctl)
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# $1 is the workspace name associated with this item (e.g. 1, 2, A, B...)
# $FOCUSED_WORKSPACE is passed as an env variable when the event triggers
sid="$1"

# 1. Highlight focused workspace
if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
else
    sketchybar --set "$NAME" background.drawing=off
fi

# 2. Dynamic visibility of non-persistent workspaces
PERSISTENT_SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9")
is_persistent=false
for p in "${PERSISTENT_SPACES[@]}"; do
    if [ "$p" = "$sid" ]; then
        is_persistent=true
    fi
done

if [ "$is_persistent" = "false" ]; then
    # If the workspace is empty, it should be hidden
    NON_EMPTY_WORKSPACES=$(aerospace list-workspaces --monitor all --empty no)
    is_empty=true
    for w in $NON_EMPTY_WORKSPACES; do
        if [ "$w" = "$sid" ]; then
            is_empty=false
            break
        fi
    done

    if [ "$is_empty" = "true" ]; then
        sketchybar --set "$NAME" drawing=off
    else
        # If not empty, it should show ONLY if chevron toggle is "expanded"
        STATE_FILE="/tmp/sketchybar_chevron_state"
        STATE="collapsed"
        if [ -f "$STATE_FILE" ]; then
            STATE=$(cat "$STATE_FILE")
        fi

        if [ "$STATE" = "expanded" ]; then
            sketchybar --set "$NAME" drawing=on
        else
            sketchybar --set "$NAME" drawing=off
        fi
    fi
fi
