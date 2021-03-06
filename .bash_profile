export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=vim
alias vi='vim'
alias l='ls'
alias ls='ls -G'
alias ll='ls -hl'
alias la="ls -a"
alias grep='grep --color=auto'
alias curl='curl -s'
alias f="open ."
alias sqlite3="sqlite3 -header -column"
# eval "$(rbenv init -)"
# stack, haskell
# eval "$(stack --bash-completion-script stack)"
alias ghc="stack ghc --"
alias ghci="stack ghci --"
alias runhaskell="stack runghc --"
alias runghc="stack runghc --"
# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/.bash-completion-files/.haskyapi.bash
source ~/.bash-completion-files/.truffle.bash
source ~/.bash-completion-files/.sbt-scala.bash
source ~/.bash-completion-files/.rebar3.bash
source ~/.bash-completion-files/.gradle.bash

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PATH
export GOPATH=$HOME/.go
paths=(
$GOPATH/bin
$HOME/.local/bin
$HOME/.cargo/bin
$HOME/.npm-global/bin
./node_modules/.bin
)
for X in ${paths[@]}; do
  PATH=$PATH:$X
done
export PATH=$PATH
# .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
# PROMPT_COMMAND
function _prompt_command(){
  local TEMP_PWD=`basename $PWD`
  echo -ne "\033]0;${TEMP_PWD/#$HOME/~}\007"
}
PROMPT_COMMAND='_prompt_command'
# Look at https://github.com/justjanne/powerline-go#customization
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -cwd-mode plain\
                                    -mode flame\
                                    -modules "kube,shell-var,venv,user,ssh,cwd,perms,git,jobs,exit,root"\
                                    -theme "solarized-dark16"\
                                    -shell-var "_JAVA_VERSION_AND_ICON"\
                                    -error $?) "
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# bash history
HISTSIZE=10000
PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -c; history -r;"
shopt -u histappend

# java path
export _JAVA_VERSION=11
export _JAVA_VERSION_AND_ICON=$'\ue738'" ${_JAVA_VERSION}"
export JAVA_HOME=`/usr/libexec/java_home -v $_JAVA_VERSION`
function javaHome() {
    local ARG_1="$1"
    if [ $ARG_1 == "1" ] || [ $ARG_1 == "8" ]; then
        ARG_1="1.8"
    fi
    /usr/libexec/java_home -v $ARG_1
    if [ $? -gt 0 ]; then
        return
    fi
    _JAVA_VERSION=$ARG_1
    _JAVA_VERSION_AND_ICON=$'\ue738'" ${_JAVA_VERSION}"
    JAVA_HOME=`/usr/libexec/java_home -v $_JAVA_VERSION`
}

# gradle
function gradle() {
    GITDIR=`git rev-parse --show-cdup 2> /dev/null`
    if [ -e "$GITDIR./gradlew" ]
    then
        echo Using $GITDIR./gradlew
        $GITDIR./gradlew "$@"
    else
        echo Using $(/usr/bin/which gradle)
        $(/usr/bin/which gradle) "$@"
    fi
}

function gcd() {
    local gdir=$(git rev-parse --show-cdup)
    local tmp=$(git ls-files -- ${gdir} | egrep 'README|build.gradle' | perl -pe's!/[^/]*\$!\n!' | sort | peco)
    local selected_dir=`dirname ${tmp}`
    if [ -n "$selected_dir" ]
    then
        cd "${selected_dir}"
    fi
}

function pecovim() {
    if [ "$1" == "" ]; then
        echo "filename argument required!"
        return
    fi
    vi `find . -name "$1" | peco`
}

# https://github.com/direnv/direnv/blob/master/docs/hook.md
eval "$(direnv hook bash)"
