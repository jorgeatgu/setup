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
'
open -a "Spotify"
# Script para darle al play Spotify
# https://github.com/hnarayanan
# https://github.com/hnarayanan/shpotify/blob/master/spotify
if [ $# != 1 ]; then
                # There are additional arguments, so find out how many
                array=( $@ );
                len=${#array[@]};
                SPOTIFY_SEARCH_API="https://api.spotify.com/v1/search"
                SPOTIFY_PLAY_URI="";

                searchAndPlay() {
                    type="$1"
                    Q="$2"

                    cecho "Searching ${type}s for: $Q";

                    SPOTIFY_PLAY_URI=$( \
                        curl -s -G $SPOTIFY_SEARCH_API --data-urlencode "q=$Q" -d "type=$type&limit=1&offset=0" -H "Accept: application/json" \
                        | grep -E -o "spotify:$type:[a-zA-Z0-9]+" -m 1
                    )
                }

            else

                # play is the only param
                osascript -e 'tell application "Spotify" to play';
            fi
# Utilizando la app de Pomodoro creada por Rachel Smith
# https://github.com/rachsmithcodes/my-pomodoro
# Activando a través de atajos de teclado de AppleScript el inicio del Pomodoro
osascript -e '
tell application "My Pomodoro" to activate
repeat 7 times
  tell application "System Events" to key code 48
end repeat
tell application "System Events" to key code 49
display notification "Empezando pomodoro 🍅" with title "A picar código! 🤓 ⚒"'
