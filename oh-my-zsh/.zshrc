# Path to your oh-my-zsh installation.
export ZSH=/Users/jorgeatgu/.oh-my-zsh

export EDITOR='subl -w'
export PATH="/usr/local/bin:/usr/local/bin/sublime:~/bin:$PATH"


source ~/.zplug/zplug

# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"


# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/emoji-cli"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"


#uses tree

$ZSH/func/welcome.sh -c

autoload -U colors
colors

#bateria

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
alias gpull="git pull origin"
alias gpush="git push origin"
alias gc="git commit -m"
alias gs="git status"
alias ga="git add"
alias cw="compass watch"
alias jekyllb="sudo jekyll build"
alias jekylls="sudo jekyll serve"
alias jsd="jekyll serve drafts"
alias ocultararchivos="defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder"
alias mostrararchivos="defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder"
alias bateria="pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"
alias wakatoday="wakatime -t or wakatime -today"
alias wakayesterday="wakatime -y or $ wakatime -yesterday"
alias wakaweek="wakatime -w or $ wakatime -week"
alias sw="sass --watch"
alias svnu="svn update"
alias svna="svn add"

alias svnc="svn commit -m"
alias svns="svn status"
alias sasswatch="sass --watch scss/styles.scss:css/styles.css"
alias wifipass="security find-generic-password -ga"
alias wifion="networksetup -setairportpower en0 on"
alias wifioff="networksetup -setairportpower en0 off"
alias wifireboot="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"
alias apagar="sudo poweroff"
alias reiniciar="sudo reboot"
alias initcss="mkdir css src js img && touch .gitignore && echo node_modules > .gitignore && cp ~/documents/package.json ./ && cp ~/documents/gulpfile.js ./  && touch index.html && cd src && mkdir css img js && cd css && touch styles.css && cd ../js && touch index.js && cd .. && cd .. && git init && git add . && git commit -m 'estructura creada' && npm install"
alias initproject="git clone https://github.com/jorgeatgu/base.git . && git remote rm origin && npm install && sudo ncu -u"
alias abrirsublime="open -a "Sublime Text""
alias canary="open -a /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --args --disable-web-security --user-data-dir"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# PM functions
source ~/.pm/pm.sh
### Enhancd plugin para dar superpoderes al CD
source ~/enhancd/enhancd.sh
source ~/emoji-cli/emoji-cli.plugin.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source $ZSH/func/zsh-syntax-highlighting.zsh

function t(){
	tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)