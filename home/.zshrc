
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

alias v='vagrant'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vd='vagrant destroy'
alias vp='vagrant provision'
alias vh='vagrant halt'

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
alias grom='git reset --hard origin/master'

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

export RBENV_VERSION=2.1.2

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

alias rvmc='rvm current'

function rvmi() {
  PROJECT_NAME=$(basename `pwd`)
  echo ${PROJECT_NAME} > .ruby-gemset
  echo "2.1.0" > .ruby-version
}

export NODENV_VERSION=4.1.1

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

if [ -d /Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home ];
then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export PATH=$PATH:/Users/jnorthridge/.rvm/bin:/Users/jnorthridge/c/misc/mrsi/bin
export PATH=$PATH:/usr/local/share/npm/bin

brew=$(which brew)
if [ -x "$brew" ];
then
  . `brew --prefix`/etc/profile.d/z.sh
fi

if [ -d "/opt/init-src/z" ];
then
  echo "Sourcing z.sh"
  . /opt/init-src/z/z.sh
fi

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
  eval "(nodenv init -)"
fi
