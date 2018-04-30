set -x GOPATH $HOME/Development/go
set -x GOROOT /usr/local/go
set -x CHANGELOG_GITHUB_TOKEN "e253e46fa6655436cecf377b729d8c2ecc2d4c4e"
set -x GOOGLE_APPLICATION_CREDENTIALS /home/sadotsoy/Documents/Mariachi/radicalConfigs/gcp.json

# So we can run go commands and go programs we have compiled ourselves
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

if status --is-interactive
  set -g fish_user_abbreviations
  # abbr --add gcm 'git commit -m'
  # etcetera
end

function fish_mode_prompt; end
# ALIAS
# FOLDERS
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias devf="cd ~/Documents/Devf"
# GIT
alias master="git checkout master"
alias development="git checkout development"
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
# NPM | YARN
alias npi="npm init"
alias yai="yarn init"
alias npis="npm install -s"
alias nps="npm install --save"
alias npg="sudo npm install --global"
alias yag="sudo yarn add global"
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
alias lsl="exa -l"
alias lsa="exa -la"
alias tree="exa -T"
# MK
alias mk="mkdir"
# TOUCH
alias fua="touch"
# FISH
alias fsh="vim ~/.config/fish/config.fish"
# TELEGRAM
alias telegram="~/Applications/Telegram/Telegram"
# CONFIG
alias config="cd ~/.config"
# APT GET
alias install="brew install"
alias update="brew update"
alias remove="brew remove"
alias search="brew search"
# N
alias n="sudo n"
# PYTON/PIP
alias python="python3.5"
alias pip="pip3"
alias env="virtualenv env"
# MARIACHI
alias mch="cd ~/Documents/Mariachi"
alias rct="cd ~/Documents/Mariachi/courses/react"
alias tok="cd ~/Documents/Mariachi/TokTok"
# OTHERS
alias int="ifconfig"
