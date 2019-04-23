# Base16 Shell

set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x GOROOT /usr/local/go
set -x EDITOR vim
set -x NODE_OPTIONS --max_old_space_size=4096
set -gx PATH $PATH:$GOBIN
set -gx PATH $PATH:$GOROOT/bin

if status --is-interactive
  set -g fish_user_abbreviations
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
  # abbr --add gcm 'git commit -m'
  # etcetera
end

function fish_mode_prompt; end
# ALIAS
# IPHONE
alias iphone="sudo killall -STOP -c usbd"
# FOLDERS
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias devf="cd ~/Documents/Devf"
# Transmission needed to instaled with brew
alias tmr="transmission-remote"
# GIT
alias master="git checkout master"
alias development="git checkout development"
alias checkout="git checkout"
alias branch="git branch"
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
# ranger
alias ran="ranger"
# NPM | YARN
alias gls="npm ls -g --depth=0"
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
alias ddel="docker rmi"
alias dps="docker ps"
# VIM
alias vrc="vim ~/.vimrc"
alias vm="vim ."

alias vi3="vim ~/.config/i3/config"
alias vkhd="vim ~/.khdrc"
# LS
alias ls="exa"
alias lsl="exa -lh"
alias lsa="exa -lah"
alias tree="exa -Th"
# SSH
alias removessh="ssh-add -D"
alias mariachissh="ssh-add ~/.ssh/id_mariachi"
alias siscreaissh="ssh-add ~/.ssh/siscrea_rsa"
alias personalssh="ssh-add ~/.ssh/id_personal"
# MK
alias mk="mkdir"
# TOUCH
alias tch="touch"
# FISH
alias fsh="vim ~/.config/fish/config.fish"
# Tmux
alias tmx="vim ~/.tmux.conf"
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
