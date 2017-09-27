  #!/bin/bash

  if [[ $(date +%u) -gt 5 && (8 <= 10#$H && 10#$H < 6) ]] ;
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
  fi
