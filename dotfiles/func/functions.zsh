function buendia() {

  if [[ $(date +%u) -gt 5 ]] ;
    then
    echo 'Es finde, tomatelo con calma'
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

}

# Alias maquinas infernales con Güindows - IE9 to Edge
function vie() {
  VBoxManage startvm "$@"
}

# Apagando máquinas virtuales
function vieOff() {
  VBoxManage controlvm "$@" acpipowerbutton
}

function stproject() {
  subl --newwindow;
  subl --projects "$1"
}

# Creando estructura de directorios y archivos para iniciar un proyecto desde cero
function initcss() {
    mkdir $1 &&
    cd $1 &&
    mkdir css src js img &&
    curl -O "https://raw.githubusercontent.com/jorgeatgu/base/master/{.stylelintrc,.gitignore,.styelintignore,package.json,gulpfile.js,index.html}" &&
    cd src &&
    mkdir css img js &&
    cd css &&
    curl -O https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css &&
    mv normalize.css _reset.css &&
    touch _variables.css &&
    curl -O https://raw.githubusercontent.com/jorgeatgu/base/master/styles.css
    cd ../js &&
    touch index.js &&
    cd .. &&
    cd .. &&
    git init &&
    git add . &&
    git commit -m 'estructura creada' &&
    npm i &&
    git commit -m 'dependencias instaladas' &&
    npm-check -u &&
    osascript -e'
    display notification "A picar código! 🤓 ⚒" with title "InitCSS completado"'
}

# Iniciando la estructura desde un repositorio ya creado o con la carpeta ya creada
function initcss-wf() {
    mkdir css src js img &&
    curl -O "https://raw.githubusercontent.com/jorgeatgu/base/master/{.stylelintrc,.gitignore,.styelintignore,package.json,gulpfile.js,index.html}" &&
    cd src &&
    mkdir css img js &&
    cd css &&
    curl -O https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css &&
    mv normalize.css _reset.css &&
    touch _variables.css &&
    curl -O https://raw.githubusercontent.com/jorgeatgu/base/master/styles.css
    cd ../js &&
    touch index.js &&
    cd .. &&
    cd .. &&
    git init &&
    git add . &&
    git commit -m 'estructura creada' &&
    npm i &&
    git commit -m 'dependencias instaladas' &&
    npm-check -u &&
    osascript -e'
    display notification "A picar código! 🤓 ⚒" with title "InitCSS completado"'
}

### Theme night Tweetbot

function tweetbotNight() {
  cd /Applications/Tweetbot.app/Contents/Resources &&
  sudo rm -rf Colors.plist &&
  curl -O "https://raw.githubusercontent.com/lucifr/Tweetbot-for-Mac-ColorScheme/master/Night/Colors.plist" &&
  osascript -e '
  tell application "Tweetbot" to quit
  tell application "Tweetbot" to activate
  '
}


### En Aragonés alcorzar es lo mismo que atajar en castellano. Esta función abre Helium y la web donde alojo todos los atajos de teclado útiles pero que no uso con la suficiente frecuencia.
function alcorze() {
  open -a Helium &&
  osascript -e '
  tell application "Helium" to activate
  tell application "System Events"
  click menu item “Location” of menu 1 of menu bar item “Open Web Url” of menu bar 1
  end tell
  '
}

# Creando un directorito y entrando en el
function folder() {
  mkdir -p "$@" && cd "$_";
}

# function to list the git repos with status
## https://github.com/eckelon/dotfiles/blob/0c0d0fe5dc7cdef7e52e83c8bf0c6fbea408bbec/zshrc#L29-L35

function gitls() {
    for d in *; do
        if [[ -d "$d" && -e "$d/.git" ]]; then
            echo "$d -> $(cd "$d" && git_prompt_info | sed 's/%//g;s/{//g;s/}//g')"
        fi
    done
}

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

# LOCURON! Abriendo apps con applescript y pasandole comandos para centrarlas con ShiftIt. No apto para losers que trabajan con las aplicaciones a full screen

function trabajo() {
  osascript -e '
  tell application "Spark" to activate
  tell application "Opera" to activate
  tell application "ShiftIt" to activate
  tell application "System Events"
  keystroke "p" using {control down, option down, command down}
  keystroke "c" using {control down, option down, command down}
  end tell
  tell application "Slack" to activate
  tell application "ShiftIt" to activate
  tell application "System Events"
  keystroke "," using {control down, option down, command down}
  keystroke "c" using {control down, option down, command down}
  end tell
  tell application "Sublime Text" to activate
  tell application "ShiftIt" to activate
  tell application "System Events"
  keystroke "," using {control down, option down, command down}
  keystroke "c" using {control down, option down, command down}
  end tell
  tell application "iTerm2" to activate
  tell application "ShiftIt" to activate
  tell application "System Events"
  keystroke "n" using {control down, option down, command down}
  keystroke "c" using {control down, option down, command down}
  end tell'
}

# Listando directorios. Gracias a http://twitter.com/wesbos
function t() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

function pomostart() {
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
      delay 3
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

      }

# Tareas de mantenimiento del Mac
# http://www.faq-mac.com/2016/12/empieza-el-ano-creando-una-rutina-de-mantenimiento-tu-mac/

function cleanMacOS() {

    osascript -e '
    display notification "Limpiando macOS 🖥" with title "Empezamos!"'
    sudo rm -rf ~/Library/Caches/ &&
    sudo update_dyld_shared_cache -debug &&
    sudo update_dyld_shared_cache -force &&
    osascript -e '
    display notification "Reiniciando 🙋" with title "Ahora volvemos!"
    do shell script "/bin/sleep 3"
    tell application "System Events" to restart'
}


# function retina() {
#     Retina="system_profiler SPDisplaysDataType | awk '/Resolution/{print $2}'"
#     sublime="/Users/jorgeatgu/Library/Application Support/Sublime Text 3/Packages/User"
#     antialias=""font_options"                 : [ "gray_antialias","
#         if [ "$Retina" = "2560" ];
#             then
#             cd "$sublime" &&
#             sed -i '' '6i\
#             $antialias' Preferences.sublime-settings
#         fi
#     # else
#     #     cd "$sublime" &&
#     #     sed -ie 's/"font_options"/#"font_options"/g' Preferences.sublime-settings
#     fi
# }

function inlineCSS () {

    #Si tu CSS ocupa menos de 50kb deberías de incluirlo en una etiqueta <style>, recomendación de Google en AMP.
    sizeM="50000"

    #Obtenemos el tamaño en bytes de nuestro archivo CSS
    size=`stat -x css/styles.css | grep Size: | awk '{ print $2 }'`

    # Si el CSS ocupa menos de 50kb lanzamos el script para insertar los estilos en línea, después removemos el
    # CSS que no usamos :)
    if [ "$size" -le "$sizeM" ];
        then
        npm run inline:css &&
        npm run remove:uncss &&
        open -a terminal-notifier --args -message "CSS style inline!!" -title "🤓" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
    else
        open -a terminal-notifier --args -message "Tu CSS ocupa más de 50Kb, algo estás haciendo mal" -title "🙄" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
    fi
}

function replaceCSSInline() {

    # Busco el número de línea donde estan los <style> y lo guardo en una variable
    estilosInit=$(sed -n '/<style/=' index.html)
    estilosEnd=$(sed -n '/<\/style/=' index.html)

    # Borro las líneas donde están los estilos en línea
    sed -i '' "/"$estilosInit"/{N;d;}" index.html &&
    sed -i '' "/"$estilosEnd"/{N;d;}" index.html &&

    # Incluyo la etiqueta link con el atributo inline
    sed -i '' '11a\
        <link rel="stylesheet" type="text/css" href="css/styles.css" inline>
    ' index.html

}


function spotifyList () {

    osascript -e '
    set volume output volume 100
    set spotifyList to {"synthWave", "modernosDePueblo", "futurecop", "trainspotting", "Nils & Olafur", "NWA"}

    choose from list spotifyList with prompt "¿Que lista quieres escuchar? 🎼" default items "None" OK button name {"Play! 🎧"} cancel button name {"Ninguna 😞"}
    set listchoice to result as text

    set synthWave to "spotify:user:megabeat:playlist:3Ay5tPYcSmt1dkfCk6mQLN"
    set modernosDePueblo to "spotify:user:megabeat:playlist:0hh6Jh9zOtgWGE7NFZytWk"
    set futurecop to "spotify:user:futurecop%21:playlist:53G6ZiWHh4m36x5og4PPku"
    set trainspotting to "spotify:user:mattiasknutson:playlist:15waV9BcHVoigwPGm0KCkM"
    set NilsOlafur to "spotify:user:megabeat:playlist:0Wodg3U7JIPzEGU8ZY5HsO"
    set NWA to "spotify:user:nwaspotify:playlist:5pO8tZWVXqmTizMZ0WoAIX"


    if listchoice is equal to "synthWave" then

        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track synthWave
        end tell
        display notification "Synthwave artists, influenced by nostalgia and fantasy" with title "🎼 🎧"
    end if


    if listchoice is equal to "modernosDePueblo" then
        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track modernosDePueblo
        end tell
        display notification "Modernos de PUEBLO" with title " 🎼 🎧"
    end if

    if listchoice is equal to "futurecop" then
        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track futurecop
        end tell
        display notification "Futurecop" with title "🎼 🎧"
    end if

    if listchoice is equal to "trainspotting" then
        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track trainspotting
        end tell
        display notification "Trainspotting BSO 🚞" with title "🎼 🎧"
    end if

    if listchoice is equal to "NilsOlafur" then
        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track NilsOlafur
        end tell
        display notification "Nils Frahm & Olafur Arnalds 🎻🎹" with title "🎼 🎧"
    end if

    if listchoice is equal to "NWA" then
        tell application "Spotify"
            launch
            delay 2
            set sound volume to 100
            play track NWA
        end tell
        display notification "Straight Outta Compton BSO 🖕🏻👮🖕🏻" with title "🎼 🎧"
    end if'

}
