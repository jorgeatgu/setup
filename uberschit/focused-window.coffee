command: """
read -r running <<<"$(ps -ef | grep \"MacOS/Spotify\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        set durSec to (duration of current track / 1000) as text
        set tM to (round (durSec / 60) rounding down) as text
        if length of ((durSec mod 60 div 1) as text) is greater than 1 then
            set tS to (durSec mod 60 div 1) as text
        else
            set tS to ("0" & (durSec mod 60 div 1)) as text
        end if
        set myTime to tM as text & ":" & tS as text
        set pos to player position
        set nM to (round (pos / 60) rounding down) as text
        if length of ((round (pos mod 60) rounding down) as text) is greater than 1 then
            set nS to (round (pos mod 60) rounding down) as text
        else
            set nS to ("0" & (round (pos mod 60) rounding down)) as text
        end if
        set nowAt to nM as text & ":" & nS as text
        return theArtist & "|" & theName & "  " & noWat & " de " & myTime
    end tell')" &&
if [ -z "$theArtist" ]
then
    echo ""
else
    echo "$theArtist - $theName" || echo "Not Connected To Spotify"
fi
"""

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <svg style="display: inline-block; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20">
  <path fill="#53B159" d="M10,1.2c-4.9,0-8.8,4-8.8,8.8s4,8.8,8.8,8.8s8.8-4,8.8-8.8S14.9,1.2,10,1.2z M13.8,14
    c-0.1,0.2-0.3,0.3-0.5,0.3c-0.1,0-0.2,0-0.3-0.1c-1.6-0.9-3.4-1.1-4.7-1c-1.4,0-2.4,0.3-2.4,0.3c-0.3,0.1-0.7-0.1-0.7-0.4
    c-0.1-0.3,0.1-0.7,0.4-0.7c0,0,1.1-0.3,2.7-0.4c0.9,0,1.8,0,2.6,0.2c1,0.2,2,0.5,2.8,1C13.9,13.3,14,13.7,13.8,14z M15,11.7
    c-0.1,0.2-0.4,0.4-0.6,0.4c-0.1,0-0.2,0-0.4-0.1c-1.9-1.1-4-1.3-5.5-1.2c-1.7,0.1-2.9,0.4-2.9,0.4c-0.4,0.1-0.8-0.1-0.9-0.5
    c-0.1-0.4,0.1-0.8,0.5-0.9c0.1,0,1.4-0.4,3.2-0.4c1.1,0,2.1,0,3.1,0.2c1.2,0.2,2.3,0.6,3.3,1.2C15,10.9,15.2,11.3,15,11.7z
     M15.7,9.5c-0.2,0-0.3,0-0.4-0.1C10.7,6.8,5,8.4,4.9,8.4C4.4,8.5,3.9,8.2,3.8,7.8C3.7,7.3,4,6.8,4.4,6.7c0.1,0,1.7-0.5,3.9-0.5
    c1.3,0,2.6,0,3.7,0.3c1.5,0.3,2.8,0.8,4,1.5c0.4,0.2,0.6,0.8,0.3,1.2C16.2,9.4,16,9.5,15.7,9.5z"/>
  </svg>
  #{output}
  """

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 14px SF Mono
  height: 25px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  top: 10px
  width: 600px
"""
