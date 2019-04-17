  function buendia() {

   if [ $(date +%u) -le 5 ] && [ $(date +%H) -le 18 ]
         then
         echo 'A trabajar!'
         osascript -e '
         set apps to {"Opera", "Slack", "Mail", "Sublime Text", "Sketch", "Numi", "Skype", "log", "Bear", "Spotify"}
         repeat with i from 1 to (count of items in apps)
         tell application (item i of apps)
         activate
         end tell
         end repeat
         '
         open -a terminal-notifier --args -message "A trabajar!" -title "⚒" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
     else
       echo 'No estas en el trabajo :)'
       osascript -e '
       set apps to {"Opera", "Spark", "tweetbot"}
       repeat with i from 1 to (count of items in apps)
       tell application (item i of apps)
       activate
       end tell
       end repeat
       '
     fi

  }
