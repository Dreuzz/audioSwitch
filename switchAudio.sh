#!/bin/bash

# Get the current default sink
current_sink=$(pactl get-default-sink)

# Check the current sink and switch accordingly
if [ "$current_sink" == "alsa_output.pci-0000_00_1f.3.analog-stereo" ]; then
    pactl set-default-sink alsa_output.pci-0000_03_00.1.hdmi-stereo-extra3
    echo "Switched to HDMI output."
elif [ "$current_sink" == "alsa_output.pci-0000_03_00.1.hdmi-stereo-extra3" ]; then
    pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
    echo "Switched to analog output."
else
    echo "Unknown default sink: $current_sink"
fi
