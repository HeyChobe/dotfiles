#!/bin/sh
cd "$(dirname "$(realpath "$0")")" || exit 1
polybar-msg cmd quit

# Launch the preview bar
polybar -q top -c preview.ini &
polybar -q mid -c preview.ini &
polybar -q bottom -c preview.ini &
