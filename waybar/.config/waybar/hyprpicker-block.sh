#!/bin/bash

# Execute hyprpicker and capture the output
CHOSEN_COLOR=$(hyprpicker -an)

# Check if hyprpicker returned a color (it returns empty if cancelled)
if [ -n "$CHOSEN_COLOR" ]; then
    # Copy the color to the clipboard
    echo -n "$CHOSEN_COLOR" | wl-copy

    # Display the color in the Waybar block (this output will be read by Waybar)
    # We also add some information about the color for the tooltip
    echo "$CHOSEN_COLOR" > $HOME/.config/waybar/color.log

    # Send a notification
    notify-send "Color Picked" "Copied $CHOSEN_COLOR to clipboard"

    # Update the Waybar block immediately
    # This sends the JSON output to Waybar
    exit 0
else
    # If hyprpicker was cancelled, output an empty string or default
    # This prevents Waybar from showing the last picked color if cancelled
    echo ""
    exit 1
fi

