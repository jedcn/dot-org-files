
ZSH=$HOME/.oh-my-zsh

DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

ZSH_THEME="sorin"

source $ZSH/oh-my-zsh.sh

RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_short_sha)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

alias e=emacsclient

alias r='rake'

alias b='bundle'
alias be='bundle exec'
alias bec='bundle exec cucumber'

alias c='pygmentize -O style=autumn -f console256 -g'

function cless () {
  colorized=$(c $1)
  echo $colorized | less
}

alias cl=cless

unalias g

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

compdef g=git

alias gf='git fetch'

alias gm='git merge --no-ff --log'

alias gcom='git checkout master'
alias gdom='git diff origin/master'
alias gpom='git push origin master'
alias grom='git reset origin/master'
alias grhom='git reset --hard origin/master'

alias gsu='git branch --set-upstream-to '
alias gdu='git diff $(git rev-parse --symbolic-full-name @{u})'
alias gru='git reset $(git rev-parse --symbolic-full-name @{u})'
alias grhu='git reset --hard $(git rev-parse --symbolic-full-name @{u})'

function gcob () {
  origin_branch_name=$1
  branch_name_without_origin=$(echo $origin_branch_name | sed 's/origin\///')
  local_branch_name=$branch_name_without_origin
  echo "Creating branch '$local_branch_name' based on '$origin_branch_name'"
  git checkout -b $local_branch_name $origin_branch_name
}

alias gca='git commit --amend'
alias gdc='git diff --cached'
alias gl='glog'
alias gla='glog --all'

alias gs='git status --short'
alias gmv='git mv'
alias grm='git rm'
alias gco='git checkout'
alias gp='git push'

alias mci='mvn clean install'

function serve {
  port="${1:-3000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

ghroving-remote-add() {
  git remote add $1 https://github.roving.com/$1/$2.git
}

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

if [ -d /Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home ];
then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export PATH=$PATH:/usr/local/share/npm/bin

if [ -d "$HOME/.homesick/repos/homeshick" ];
then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi

function sync_dot_files() {
  homeshick pull
}

if [ -f "/opt/boxen/env.sh" ];
then
  source /opt/boxen/env.sh
fi

if [ -x "/opt/boxen/nodenv/bin/nodenv" ]; then
  eval "$(nodenv init -)"
fi

LATEST_NODENV_VERSION=$(nodenv versions | tail -1 | sed 's/ //g')
export NODENV_VERSION=$LATEST_NODENV_VERSION

LATEST_RBENV_VERSION=$(rbenv versions | tail -1 | sed 's/* //' | sed 's/ .*$//')
export RBENV_VERSION=$LATEST_RBENV_VERSION

if [ -f ~/src/wayfair-dot-files/wayfair.sh ];
then
  source ~/src/wayfair-dot-files/wayfair.sh
fi
