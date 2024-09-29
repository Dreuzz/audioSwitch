#!/bin/bash

current_dir=${PWD}/assets/gear.svg

# Get the current default sink
current_sink=$(pactl get-default-sink)

# Check the current sink and switch accordingly
if [ "$current_sink" == "alsa_output.pci-0000_00_1f.3.analog-stereo" ]; then
    pactl set-default-sink alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2
    echo "Switched to HDMI output."
    notify-send "Switched to HDMI output." -i $current_dir
elif [ "$current_sink" == "alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2" ]; then
    pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
    echo "Switched to analog output."
    notify-send "Switched to analog output." -i $current_dir
else
    echo "Unknown default sink: $current_sink"
fi
