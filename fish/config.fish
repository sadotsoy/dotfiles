# Base16 Shell

# ----GENERAL
set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x BYOBU_PREFIX /usr/local
# ----NODE
set -x NODE_OPTIONS --max_old_space_size=4096
# set -x OP_SESSION_my EMJkHkExAQ0jRdIiAWRcouctNvQoVL6u9nRTHazTzJc
# ----GO
# set -x GOPATH $HOME/go
# set -x GOBIN $HOME/go/bin
# set -x GOROOT /usr/local/go
# set -gx PATH $PATH:$GOBIN
# set -gx PATH $PATH:$GOROOT/bin
# -----ANDROID
# set -x ANDROID_HOME $HOME/Library/Android/sdk
# set -gx PATH $PATH:$ANDROID_HOME
# set -gx PATH $PATH:$ANDROID_HOME/emulator
# set -gx PATH $PATH:$ANDROID_HOME/tools
# set -gx PATH $PATH:$ANDROID_HOME/tools/bin
# set -gx PATH $PATH:$ANDROID_HOME/platform-tools
# ----PYTHON
# set -x PYTHON_PATH /usr/local/bin/python3
# set -g PATH $PATH:$PYTHON_PATH
# set VIRTUAL_ENV "/Users/sadotsoy/workspace/freshkampo/fkguacamole"
# ----CYPRES
# set -x HTTP_PROXY http://my-company-proxy.com


if status --is-interactive
  set -g fish_user_abbreviations
  # set BASE16_SHELL "$HOME/.config/base16-shell/"
  # source "$BASE16_SHELL/profile_helper.fish"
  # abbr --add gcm 'git commit -m'
  # etcetera
end

function fish_mode_prompt; end

# https://github.com/jethrokuan/z
#Z
alias zh="cd (z -l | hh | sed 's/^[0-9,.]* *//')"
# FzF
alias hh="fzf --inline-info --height 20% --reverse"
alias nh="nvim (hh | sed 's/^[0-9,.]* *//')"
#GENERAL
alias alcr="nvim ~/dotfiles/alacritty/alacritty.yml"
#FKENV
alias fkenv="source ~/workspace/freshkampo/fkguacamole/bin/activate.fish"
alias mng="./manage.py"
# kitty + complete setup fish | source
alias weather="curl http://v2.wttr.in/gdl"
#kitty
alias ktty="nvim ~/dotfiles/kitty/kitty.conf"
#onePassword needs jq (brew)
alias password="jq '.details.fields[] | select(.designation==\"password\").value'"
# YABAI
alias yab="brew services restart yabai"
alias stayab="brew services start yabai"
alias stoyab="brew services stop yabai"
# skhd
alias rsk="skhd --reload"
alias stask="brew services start skhd"
alias stosk="brew services stop skhd"
# VIFM
alias fm="vifm ."
# WORKSPACE
alias guru="cd ~/workspace/guru"
alias personal="cd ~/workspace/personal"
alias frida="cd ~/workspace/frida"
alias server="./utils/ngrock http 3000"
alias ed="nvim"
alias vim="nvim"
alias dark="cd ~/workspace/personal/darkforce-vim-colors"
# ALIAS
# IPHONE
alias iphone="sudo killall -STOP -c usbd"
# DEV
alias rn="react-native"
alias rmn="rm -rf node_modules package-lock.json"
alias rmy="rm -rf node_modules yarn-lock.json"
alias iosdevices="xcrun simctl list devices | grep iPhone"
# WINDOWMANAGER
alias skhdrc="nvim ~/dotfiles/skhd/skhdrc"
alias yabairc="nvim ~/dotfiles/yabai/yabairc"
# FOLDERS
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias devf="cd ~/Documents/Devf"
# Transmission needed to instaled with brew
alias tmr="transmission-remote"
# GIT
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias develop="git checkout develop"
alias development="git checkout development"
alias diff="git diff"
alias fetch="git fetch"
alias ga="git add"
alias gbd="git branch -D"
alias gcm="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcof="git checkout --"
alias gig="gitignore osx vim windows linux"
alias gin="git init"
alias glog="git log --oneline --graph"
alias glist="git log --format=\"- %h %s\" --oneline"
alias gp="git push origin"
alias gs="git status"
alias master="git checkout master"
alias pdev="git push origin development"
alias pmas="git push -u origin master"
alias pull="git pull origin"
alias push="git push origin"
alias reset="git reset HEAD"
alias standup="git-standup"
alias stash="git stash"
alias vgit="git log | vim -R-"
# gsearch need 'string' and path
alias gsearch="git log -c -S"
# ranger
alias ra="ranger"
# NPM | YARN
alias gls="npm ls -g --depth=0"
alias nls="npm ls"
alias npg="sudo npm install --global"
alias npi="npm init"
alias npis="npm install -s"
alias nps="npm install --save"
alias rgm='npm ls -gp --depth=0 | awk -F/ \'/node_modules/ && !/\/npm$/ {print $NF}\' | xargs npm -g rm'
alias yaa="yarn add"
alias yaga="yarn global add"
alias yai="yarn install"
alias yain="yarn init"
# DOCKER
alias dbu="docker-compose build"
alias ddel="docker rm -f"
alias dimg="docker images"
alias dpru="docker system prune"
alias dps="docker ps"
alias dup="docker-compose up"
# VIM
alias nvrc="nvim ~/dotfiles/nvim/init.vim"
alias vf="nvim -c \":EditVifm\""

alias vi3="nvim ~/.config/i3/config"
alias vkhd="nvim ~/.khdrc"
# LS
alias ls="exa --long --git"
alias lsl="exa -lh --git"
alias lsa="exa -lah --git"
alias tree="exa -Th "
# SSH
alias removessh="ssh-add -D"
alias personalssh="ssh-add ~/.ssh/id_sadotsoy"
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
alias remove="brew remove"
alias search="brew search"
alias update="brew update"
alias upgrade="brew upgrade"
alias brw="nvim ~/dotfiles/brew/brew.sh"
# POSTGRES
alias startpostgres="postgres -D /usr/local/var/postgres"
# N
alias n="sudo n"
# PYTON/PIP
alias env="virtualenv env"
alias pip="pip3"
alias python="python3"
# OTHERS
alias int="ifconfig"

set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
# source (curl -sSL git.io/forgit.fish | psub)

# node@14
fish_add_path /usr/local/opt/node@14/bin
