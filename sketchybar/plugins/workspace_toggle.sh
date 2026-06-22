#!/bin/bash

STATE_FILE="/tmp/sketchybar_chevron_state"
if [ ! -f "$STATE_FILE" ]; then
    echo "collapsed" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

PERSISTENT_SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9")
ALL_WORKSPACES=$(aerospace list-workspaces --all)
NON_PERSISTENT_SPACES=()

for sid in $ALL_WORKSPACES; do
    is_persistent=false
    for p in "${PERSISTENT_SPACES[@]}"; do
        if [ "$p" = "$sid" ]; then
            is_persistent=true
        fi
    done
    if [ "$is_persistent" = "false" ]; then
        NON_PERSISTENT_SPACES+=("$sid")
    fi
done

if [ "$STATE" = "collapsed" ]; then
    # Expand
    echo "expanded" > "$STATE_FILE"
    sketchybar --set space_chevron icon=""
    
    # Show active (non-empty) workspaces
    ACTIVE_WORKSPACES=$(aerospace list-workspaces --monitor all --empty no)
    for sid in "${NON_PERSISTENT_SPACES[@]}"; do
        is_active=false
        for a in $ACTIVE_WORKSPACES; do
            if [ "$a" = "$sid" ]; then
                is_active=true
            fi
        done
        if [ "$is_active" = "true" ]; then
            sketchybar --set "space.$sid" drawing=on
        fi
    done
else
    # Collapse
    echo "expanded" # just in case, but write collapsed to state file:
    echo "collapsed" > "$STATE_FILE"
    sketchybar --set space_chevron icon=""
    
    # Hide all non-persistent workspaces
    for sid in "${NON_PERSISTENT_SPACES[@]}"; do
        sketchybar --set "space.$sid" drawing=off
    done
fi
