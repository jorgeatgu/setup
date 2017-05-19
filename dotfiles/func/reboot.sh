## Reboot
## http://stackoverflow.com/questions/495323/quit-all-applications-using-applescript
## Modificado el script para que al lanzar el comando no cierre iTerm. Incluímos un mensaje para saber que script hemos ejecutado
## http://macscripter.net/viewtopic.php?id=41739
function reiniciar() {
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
    repeat
       try
           set SAS to (path to library folder from user domain as text) & "Saved Application State:"
           exit repeat
       on error
           delay 0.1
       end try
    end repeat
    tell application "System Events" to tell folder SAS
       delete every folder
    end tell
    display notification "Reiniciando... 🚀" with title "Empezamos de nuevo!"
    do shell script "/bin/sleep 5"
    tell application "System Events" to restart'
}
