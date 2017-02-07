#!/bin/bash

if [[ $(date +%u) -gt 5 ]] ;
  then
    echo 'Es finde, tomatelo con calma'
    osascript -e '
    tell application "Spark" to activate
    tell application "Opera" to activate
    '
  else
    osascript -e '
      tell application "Spark" to activate
      tell application "Opera" to activate
      tell application "Slack" to activate
      tell application "Sublime Text" to activate
    '
fi
