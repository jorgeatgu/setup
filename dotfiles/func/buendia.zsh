  #!/bin/bash

  #Comprobamos la hora, si son más de las 18 no estamos en el trabajo :)
  if [[ $(date +%H) -gt 18 ]] ;
      then
      echo 'No estas en el trabajo :)'
      osascript -e '
      tell application "Spark" to activate
      tell application "Opera" to activate
      '
  else
    osascript -e '
    tell application "Mail" to activate
    tell application "Opera" to activate
    tell application "Slack" to activate
    tell application "Sublime Text" to activate
    '
    open -a terminal-notifier --args -message "A trabajar!" -title "⚒" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
  fi
