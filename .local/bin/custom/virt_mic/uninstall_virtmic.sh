#!/bin/bash
# Uninstall the virtual microphone.

pactl unload-module module-pipe-source
rm /home/infiltrator/.config/pulse/client.conf
