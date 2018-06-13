  #!/bin/bash

  #Comprobamos la hora y el día. Si son menos de las 18 y es entre lunes y viernes estas en el trabajo
  if [ $(date +%u) -lt 5 ] && [ $(date +%H) -lt 18 ]
      then
      echo 'A trabajar!'
      osascript -e '
      tell application "Opera" to activate
      tell application "Slack" to activate
      tell application "Sublime Text" to activate
      tell application "Sketch" to activate
      tell application "Numi" to activate
      tell application "Skype" to activate
      tell application "log" to activate
      tell application "Bear" to activate
      tell application "Spotify" to activate
      '
      open -a terminal-notifier --args -message "A trabajar!" -title "⚒" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
  else
    echo 'No estas en el trabajo :)'
    osascript -e '
    tell application "Spark" to activate
    tell application "Opera" to activate
    '
  fi

