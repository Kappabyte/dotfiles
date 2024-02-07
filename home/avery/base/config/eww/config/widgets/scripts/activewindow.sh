#!/bin/sh
hyprctl activewindow | grep title | cut -d' ' -f2-
