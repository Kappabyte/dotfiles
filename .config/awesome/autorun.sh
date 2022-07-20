#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    $@&
  fi
}

run "/home/avery/.local/bin/streamdeck" "-n"

echo done