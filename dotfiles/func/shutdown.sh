## Shutdown
## http://stackoverflow.com/questions/495323/quit-all-applications-using-applescript
## Modificado el script. Incluímos un mensaje para saber que script hemos ejecutado

function apagar() {
  osascript -e '
  tell application "System Events" to set the visible of every process to true
  set white_list to {"Finder", "iTerm2"}
  try
  tell application "Finder"
  set process_list to the name of every process whose visible is true
  end tell
  repeat with i from 1 to (number of items in process_list)
  set this_process to item i of the process_list
  if this_process is not in white_list then
    tell application this_process
    quit application
    end tell
    end if
    end repeat
    end try
    display notification "Apagando 🚨" with title "Adios!"
    do shell script "/bin/sleep 3"
    tell app "System Events" to shut down'
}
