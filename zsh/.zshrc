# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# email for vim c file headers
export MAIL="$USER.taieb.safe@gmail.com"
# Set the theme - "agnoster" is a popular choice for developers
ZSH_THEME="cloud"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# ENABLE_AUTO_UPDATE="true"

# Set to "true" to show red dots on the right prompt for errors.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(
    git
    docker
    docker-compose
    kubectl
    podman
    composer
    symfony
    npm
    yarn
    nvm
    zsh-syntax-highlighting
    zsh-autosuggestions
    z
    autojump
    sudo
    extract       # Alias to extract archives
    colored-man-pages  # Colors for man pages
    command-not-found  # Suggest installable packages when command is not found
    history-substring-search  # Search history with up/down arrows
    copyfile      # Adds copy command for file paths
    cp            # Adds progress bar to the `cp` command
)

# Source plugins
source $ZSH/oh-my-zsh.sh

# Path to your custom functions, if any
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Setting up nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=lightblue,bold'

# General Aliases
alias cls='clear'
alias ll='ls -lah'
alias lsa='ls -a'
alias gs='git status'
alias gc='git commit -v'
alias gp='git push'
alias gd='git diff'
alias e='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkd='mkdir -p'

# Git Aliases
alias ga='git add'
alias gaa='git add .'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gbr='git branch'
alias glg='git log --oneline --graph --decorate --all'
alias gst='git stash'
alias gsta='git stash apply'
alias grh='git reset --hard'
alias gpo='git push origin'
alias gpl='git pull'

# Docker and Docker Compose Aliases
alias dps='docker ps'
alias dip='docker inspect --format="{{.NetworkSettings.IPAddress}}"'
alias drm='docker rm $(docker ps -a -q)'
alias drun='docker run -it'
alias dbuild='docker build -t'
alias dstop='docker stop $(docker ps -q)'
alias dstart='docker start $(docker ps -q)'
alias dlogs='docker logs -f'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dce='docker-compose exec'
alias dcb='docker-compose build'

# Podman Aliases
alias psp='podman ps'
alias prm='podman rm -a'
alias prun='podman run -it'
alias pstop='podman stop -a'
alias plogs='podman logs -f'
alias pbuild='podman build -t'

# Kubernetes & kubectl Aliases
alias k='kubectl'
alias kctx='kubectl config use-context'
alias kdel='kubectl delete pod'
alias kget='kubectl get pods'
alias klog='kubectl logs -f'

# Puppet Aliases
alias pp='puppet'
alias ppa='puppet apply'
alias ppl='puppet lint'
alias ppd='puppet doc'
alias pps='puppetserver'

# PHP and Symfony Aliases
alias art='php artisan'
alias phpunit='vendor/bin/phpunit'
alias sf='php bin/console'
alias sfc='php bin/console cache:clear'
alias sfcc='php bin/console cache:clear && php bin/console cache:warmup'
alias sfm='php bin/console make:entity'
alias sfd='php bin/console doctrine:schema:update --force'
alias sfs='symfony server:start'
alias sfstop='symfony server:stop'

# Node.js / JavaScript Aliases
alias npmi='npm install'
alias npms='npm start'
alias npmt='npm test'
alias nrb='npm run build'
alias yci='yarn install'
alias ycs='yarn start'

# DevOps Aliases
alias tf='terraform'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfi='terraform init'
alias tfs='terraform show'
alias tfp='terraform plan'

alias vi='vim'

# Commonly Used Functions
# Quickly create a ZIP file
function mkzip() { zip -r "$1".zip "$1"; }

# Extract file based on extension
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xjf $1    ;;
           *.tar.gz)    tar xzf $1    ;;
           *.bz2)       bunzip2 $1    ;;
           *.rar)       unrar x $1    ;;
           *.gz)        gunzip $1     ;;
           *.tar)       tar xf $1     ;;
           *.tbz2)      tar xjf $1    ;;
           *.tgz)       tar xzf $1    ;;
           *.zip)       unzip $1      ;;
           *.Z)         uncompress $1 ;;
           *.7z)        7z x $1       ;;
           *)           echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Docker Compose Down and Remove All Volumes
dcdv() {
  docker-compose down --volumes
}

# Kubernetes: Watch pods in real-time
kwatch() {
  kubectl get pods --watch
}

# Set default editor
export EDITOR='vim'

# Automatically set the title of terminal windows
case $TERM in
    xterm*|rxvt*)
        precmd () { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
esac

# Enable shared history
setopt SHARE_HISTORY

# Fix history commands auto-mismatch between lines
setopt HIST_IGNORE_SPACE

# Increase Zsh history file size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Add more paths here
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load the completion system
autoload -U compinit && compinit

. ~/z/z.sh
