
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jedcn"

DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=()

source $ZSH/oh-my-zsh.sh

alias r='rake'

alias c='pygmentize -O style=monokai -f console256 -g'

alias v='vagrant'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vd='vagrant destroy'
alias vp='vagrant provision'
alias vh='vagrant halt'

alias gc='git commit'
alias ga='git add'
alias gb='git branch'

#
# git diff..
alias gd='git diff'
alias gdc='git diff --cached'

#
# git status..
alias gs='git status --short'

#
# git fetch..
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfa='git fetch --all'

#
alias glog='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'

#
# git merge
alias gm='git merge --no-ff --log'
alias gmnofflog='git merge --no-ff --log'

#
# git mv
alias gmv='git mv'

#
# git rm
alias grm='git rm'

#
# git reset..
alias grod='git reset --hard origin/development'
alias grom='git reset --hard origin/master'
alias groi='git reset --hard origin/integration'
alias gror='git reset --hard origin/release'

#
# git checkout..
alias gco='git checkout'
alias gcod='git checkout development'
alias gcoi='git checkout integration'
alias gcom='git checkout master'
alias gcor='git checkout release'

#
# git diff..
alias gdoi='git diff origin/integration'
alias gdod='git diff origin/development'
alias gdom='git diff origin/master'

#
# git push..
alias gp='git push'
alias gpodd='git push origin development:development'
alias gpoii='git push origin integration:integration'
alias gpomm='git push origin master:master'

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function serve {
  port="${1:-3000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export PATH=$PATH:/Users/jnorthridge/.rvm/bin:/Users/jnorthridge/c/mrsi/bin
export PATH=$PATH:/usr/local/share/npm/bin

brew=$(which brew)
if [ -x "$brew" ] ; then
  . `brew --prefix`/etc/profile.d/z.sh
fi
