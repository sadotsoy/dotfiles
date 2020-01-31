# Base16 Shell

set -x OP_SESSION_my EMJkHkExAQ0jRdIiAWRcouctNvQoVL6u9nRTHazTzJc
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x GOROOT /usr/local/go
set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x NODE_OPTIONS --max_old_space_size=4096
set -gx PATH $PATH:$GOBIN
set -gx PATH $PATH:$GOROOT/bin
# ANDROID
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $PATH:$ANDROID_HOME
set -gx PATH $PATH:$ANDROID_HOME/emulator
set -gx PATH $PATH:$ANDROID_HOME/tools
set -gx PATH $PATH:$ANDROID_HOME/tools/bin
set -gx PATH $PATH:$ANDROID_HOME/platform-tools


if status --is-interactive
  set -g fish_user_abbreviations
  # set BASE16_SHELL "$HOME/.config/base16-shell/"
  # source "$BASE16_SHELL/profile_helper.fish"
  # abbr --add gcm 'git commit -m'
  # etcetera
end

function fish_mode_prompt; end

#GENERAL
alias weather="curl http://v2.wttr.in/"
#onePassword needs jq (brew)
alias password="jq '.details.fields[] | select(.designation==\"password\").value'"
# WORKSPACE
alias guru="cd ~/workspace/guru"
alias personal="cd ~/workspace/personal"
alias vim="nvim"
alias server="./utils/ngrock http 3000"
# ALIAS
# IPHONE
alias iphone="sudo killall -STOP -c usbd"
# DEV
alias rn="react-native"
alias iosdevices="xcrun simctl list devices | grep iPhone"
# FOLDERS
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias devf="cd ~/Documents/Devf"
# Transmission needed to instaled with brew
alias tmr="transmission-remote"
# GIT
alias master="git checkout master"
alias development="git checkout development"
alias develop="git checkout develop"
alias checkout="git checkout"
alias branch="git branch"
alias stash="git stash"
alias reset="git reset HEAD"
alias diff="git diff"
alias pull="git pull origin"
alias push="git push origin"
alias pdev="git push origin development"
alias pmas="git push -u origin master"
alias ga="git add"
alias gs="git status"
alias gcm="git commit"
alias gbd="git branch -D"
alias gcob="git checkout -b"
alias gcof="git checkout --"
alias gco="git checkout"
alias gig="gitignore osx vim windows linux"
alias gin="git init"
alias gp="git push origin"
alias glog="git log --oneline --graph"
alias clone="git clone"
alias standup="git-standup"
# ranger
alias ra="ranger"
# NPM | YARN
alias gls="npm ls -g --depth=0"
alias rgm='npm ls -gp --depth=0 | awk -F/ \'/node_modules/ && !/\/npm$/ {print $NF}\' | xargs npm -g rm'
alias nls="npm ls"
alias npi="npm init"
alias yain="yarn init"
alias yai="yarn install"
alias yaga="yarn global add"
alias yaa="yarn add"
alias npis="npm install -s"
alias nps="npm install --save"
alias npg="sudo npm install --global"
# DOCKER
alias dbu="docker-compose build"
alias dup="docker-compose up"
alias dimg="docker images"
alias dpru="docker system prune"
alias ddel="docker rm -f"
alias dps="docker ps"
# VIM
alias nvrc="nvim ~/dotfiles/nvim/init.vim"
alias nvm="nvim ."

alias vi3="nvim ~/.config/i3/config"
alias vkhd="nvim ~/.khdrc"
# LS
alias ls="exa --long --git"
alias lsl="exa -lh --git"
alias lsa="exa -lah --git"
alias tree="exa -Th "
# SSH
alias removessh="ssh-add -D"
alias personalssh="ssh-add ~/.ssh/id_personal"
# MK
alias mk="mkdir"
# TOUCH
alias tch="touch"
# FISH
alias fsh="nvim ~/.config/fish/config.fish"
# Tmux
alias tmx="nvim ~/.tmux.conf"
alias xmain="tmux new -s main"
alias xcontrol="tmux new -s control"
# TELEGRAM
alias telegram="~/Applications/Telegram/Telegram"
# CONFIG
alias config="cd ~/.config"
# APT GET
alias install="brew install"
alias update="brew update"
alias upgrade="brew upgrade"
alias remove="brew remove"
alias search="brew search"
# N
alias n="sudo n"
# PYTON/PIP
alias python="python3"
alias pip="pip3"
alias env="virtualenv env"
# OTHERS
alias int="ifconfig"

