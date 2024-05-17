#!/usr/bin/env bash

OGUI_BIN="<<storedir>>/share/opengamepadui/opengamepad-ui.x86_64}"

GAMESCOPE_CMD="gamescope -w 1920 -h 1080 -f --xwayland-count 2"

# Launch normally if gamescope is not running
if ls /run/user/${UID}/gamescope* >/dev/null 2>&1; then
    echo "Executing: ${OGUI_BIN}"
    exec ${OGUI_BIN}
fi
echo "Executing: ${GAMESCOPE_CMD} -- ${OGUI_BIN}"
exec ${GAMESCOPE_CMD} -- ${OGUI_BIN}
