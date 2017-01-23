# Path to your oh-my-zsh installation.
export ZSH=/Users/jorgeatgu/.oh-my-zsh

export EDITOR='subl -w'
export PATH="/usr/local/bin:/usr/local/bin/sublime:~/bin:$PATH"

source ~/.zplug/zplug
zplug "jorgeatgu/zplug"

# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"


# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/enhancd"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

#Antiguo mensaje de bienvenida
#$ZSH/func/welcome.sh -c

autoload -U colors
colors

# Movida para mostrar la bateria en el PROMPT
PROMPT='%{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%  →'
RPROMPT='%{$fg[black]%}%{$fg[yellow]%}$(/$ZSH/func/batterycharge.sh)% %{$fg[white]%}'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github osx k emoji-cli)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Alias
alias zshconfig="sublime ~/.zshrc"
alias ohmyzsh="sublime ~/.oh-my-zsh"

# Abriendo proyectos de Sublime Text a través de CLI
alias sgithub="subl --projects github"
alias sblog="subl --projects blog"
alias sweb="subl --projects web"
alias ssetup="subl --projects setup"

# Git
alias gpull="git pull origin"
alias gpush="git push origin"
alias gc="git commit -m"
alias gs="git status"
alias ga="git add"

# Jekyll
alias jekyllb="sudo jekyll build"
alias jekylls="sudo jekyll serve"
alias jsd="jekyll serve drafts"

# OSX
alias ocultararchivos="defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder"
alias mostrararchivos="defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder"
alias bateria="pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"
alias blueon="sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1"
alias blueoff="sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0 && \
sudo killall -HUP blued"
alias wifipass="security find-generic-password -ga"
alias wifion="networksetup -setairportpower en0 on"
alias wifioff="networksetup -setairportpower en0 off"
alias wifireboot="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"
alias myip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias remapkey="/Users/jorgeatgu/Downloads/EasyAVR-master/easykeymap.sh"

#Generando un password y copiandolo en el portapapeles
alias gpass="LC_ALL=C tr -dc '[:alpha:][:alnum:]' < /dev/urandom | head -c 40 | pbcopy"

#Lanzando un servidor
alias startserver="python -m SimpleHTTPServer"
alias abrirsublime="open -a "Sublime Text""

#Away from keyboard :smoking:
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

#Update masivo actualizaciones OSX, Brew, NPM y GEM.
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup"

#Update de apps de la AppStore
alias updateApps="mas upgrade"

#Apps desactualizadas de la AppStore
alias updateList="mas outdated"

# SCSS
alias sw="sass --watch"
alias sasswatch="sass --watch scss/styles.scss:css/styles.css"

# Lanzando Canary y Chrome con la seguridad desactivada
alias canary="open -a /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --args --disable-web-security --user-data-dir"
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --disable-web-security --user-data-dir"

# Pomodoro
alias pomostart="source $ZSH/func/pomodoro.sh -e start"
alias pomoend="source $ZSH/func/pomodoro-end.sh -c"

# KWM
alias kwmStart="brew services start kwm"
alias kwmStop="brew services stop kwm"
alias kwmconfig="open -a 'Sublime Text' /usr/local/Cellar/kwm/4.0.2/kwmrc"

# Obtener la previsión del tiempo
alias tiempo="curl wttr.in/zaragoza"

# Funciones que uso a menudo

# Listando directorios. Gracias a http://twitter.com/wesbos
function t() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
# function t(){
#   tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
# }

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
          quit
        end tell
      end if
    end repeat
  end try
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
          quit
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
  tell application "Mail" to activate
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


# tell application "System Events"
#   activate
#   get name of every desktop
#   set DesktopNames to name of every desktop
# end tell
# DesktopNames

# Creando estructura de directorios y archivos para iniciar un proyecto desde cero
function initcss() {
  mkdir $1 &&
  cd $1 &&
  mkdir css src js img &&
  touch .gitignore &&
  echo node_modules > .gitignore &&
  curl -O "https://raw.githubusercontent.com/jorgeatgu/setup/master/initcss/{.stylelintrc,package.json,gulpfile.js}" &&
  touch index.html &&
  cd src &&
  mkdir css img js &&
  cd css &&
  curl -O https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css &&
  mv normalize.css _reset.css &&
  touch _variables.css &&
  curl -O https://raw.githubusercontent.com/jorgeatgu/setup/master/initcss/styles.css
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

#Iniciando la estructura desde un repositorio ya creado o con la carpeta ya creada
function initcss-wf() {
  mkdir css src js img &&
  touch .gitignore &&
  echo node_modules > .gitignore &&
  curl -O "https://raw.githubusercontent.com/jorgeatgu/setup/master/initcss/{.stylelintrc,package.json,gulpfile.js}" &&
  touch index.html &&
  cd src &&
  mkdir css img js &&
  cd css &&
  mkdir base components layout pages &&
  cd base &&
  curl -O https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css &&
  mv normalize.css _reset.css &&
  touch _variables.css &&
  cd ../components &&
  touch _{buttons,navigation}.css &&
  cd ../layout &&
  touch _{header,footer}.css &&
  cd ../pages &&
  touch _home.css &&
  cd .. &&
  curl -O https://raw.githubusercontent.com/jorgeatgu/setup/master/initcss/styles.css
  cd ../js &&
  touch index.js &&
  cd .. &&
  cd .. &&
  git init &&
  git add . &&
  git commit -m 'estructura creada' &&
  npm i &&
  sudo npm-check -u &&
  osascript -e 'display notification "A picar código! 🤓 ⚒" with title "InitCSS completado"'
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

function stproject() {
  subl --newwindow;
  subl --projects "$1"
}

##Elimina del historial los comandos duplicados
export HISTCONTROL=ignoreboth:erasedups


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Autocompletando rutas infernales a base de sugerencias, no esta mal pero es mejor enhancd
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# PM functions
source ~/.pm/pm.sh

# Z functions
source ~/z/z.sh

# Enhancd plugin para dar superpoderes al CD
source ~/enhancd/enhancd.sh

# Emoji terminal
source ~/emoji-cli/emoji-cli.plugin.zsh

# Autocompletado a base de sugerencias
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source $ZSH/func/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

export PATH="$HOME/.yarn/bin:$PATH"


# Movidas de GO!
# don't forget to change your path correctly!
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
