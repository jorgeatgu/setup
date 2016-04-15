osascript -e 'quit app "Slack"'
osascript -e 'quit app "Tweetbot"'
osascript -e 'quit app "Mail"'
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
open -a "Pomodoro Time"