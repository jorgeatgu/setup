# La whitelist es la lista de aplicaciones que no quieres cerrar, aplicación
# que este abierta en el momento de lanzar script sera cerrada. Abrimos las
# aplicaciones con las que producimos


osascript -e '
  tell application "System Events" to set the visible of every process to true
  set white_list to {"Finder", "iTerm2", "Sublime Text", "Spotify", "Opera"}
  try
    tell application "Finder"
      set process_list to the name of every process whose visible is true
    end tell
    repeat with i from 1 to (number of items in process_list)
      set this_process to item i of the process_list
      if this_process is not in white_list then
        tell application this_process
          quit
        end tell
      end if
    end repeat
  end try
  tell application "Sublime Text" to activate
  tell application "iTerm2" to activate
  tell application "Opera" to activate
  tell application "Spotify" to activate
  delay 1
  tell application "Spotify" to play
  tell application "My Pomodoro"
  if it is running then
    display notification "Pomodoro 🍅 ya esta abierto" with title "A currar!"
  else
    activate
  end if
  end tell
'

open -a terminal-notifier --args -message "A trabajar!" -title "🍅" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
