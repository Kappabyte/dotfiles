#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

eww open bar_right -c ${SCRIPT_DIR}
eww open bar_left -c ${SCRIPT_DIR}
