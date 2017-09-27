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
zplug "b4b4r07/enhancd", use:init.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

#Antiguo mensaje de bienvenida
$ZSH/func/welcome.sh -c

autoload -U colors
colors

# Movida para mostrar la bateria en el PROMPT
PROMPT='%{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%'
RPROMPT='%{$fg[black]%}%{$fg_bold[yellow]%}$(~/.zsh/func/batterycharge.sh)%  💻'


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
plugins=(git github osx k emoji-cli alias-tips)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Alias
alias zshconfig="sublime ~/.zshrc"
alias ohmyzsh="sublime ~/.oh-my-zsh"

# Alias suffix
alias -s git='git clone'
alias -s sass='subl'
alias -s css='subl'

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
alias pullpush="git pull origin $(current_branch) && git push origin $(current_branch)"

# Jekyll
alias jekyllb="sudo jekyll build"
alias jekylls="sudo jekyll serve"
alias jsd="jekyll serve drafts"

# OSX
alias copypath= "pwd | pbcopy"
alias opera="/Applications/Opera.app/Contents/MacOS/Opera"
alias operacache="sudo rm -rf ~/Library/Caches/com.operasoftware.Opera/Cache"
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
alias papelera="sudo rm -rfv /Volumes/\*/.Trashes; sudo rm -rfv \$HOME/.Trash/; sudo rm -rfv /private/var/log/asl/\*.asl"
alias spapelera="sudo srm -rfv /Volumes/\*/.Trashes; sudo srm -rfv \$HOME/.Trash/; sudo srm -rfv /private/var/log/asl/\*.asl"


#Generando un password y copiandolo en el portapapeles
alias gpass="LC_ALL=C tr -dc '[:alpha:][:alnum:]' < /dev/urandom | head -c 40 | pbcopy"

#Lanzando un servidor
alias startserver="python -m SimpleHTTPServer"
alias abrirsublime="open -a "Sublime Text""

#Away from keyboard :smoking:
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

#Update masivo actualizaciones OSX, Brew, NPM y GEM.
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup"

alias updateOSX="sudo softwareupdate -i -a"
alias updateBrew="brew update; brew upgrade; brew cleanup;"
alias updateNpm="npm i npm -g; npm update -g"
alias updateGem="sudo gem update --system; sudo gem update; sudo gem cleanup"

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
alias pomostart="source ~/.zsh/func/pomodoro.sh -e start"

# KWM
alias kwmStart="brew services start kwm"
alias kwmStop="brew services stop kwm"
alias kwmconfig="open -a 'Sublime Text' /usr/local/Cellar/kwm/4.0.2/kwmrc"

# Obtener la previsión del tiempo
alias tiempo="curl -H 'Accept-Language: es' wttr.in/Zaragoza"

##Elimina del historial los comandos duplicados
export HISTCONTROL=ignoreboth:erasedups

# Cargando todas las funciones
source ~/.zsh/func/functions.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Autocompletando rutas infernales a base de sugerencias, no esta mal pero es mejor enhancd
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# PM functions
source ~/.pm/pm.sh

# Z functions
source ~/z/z.sh

# Enhancd plugin para dar superpoderes al CD
source ~/enhancd/init.sh

# Emoji terminal
source ~/emoji-cli/emoji-cli.plugin.zsh

# Autocompletado a base de sugerencias
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.zsh/func/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
