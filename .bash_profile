export LSCOLORS=gxfxcxdxbxegedabagacad
alias vi='vim'
alias l='ls'
alias ls='ls -G'
alias ll='ls -hl'
alias la="ls -a"
alias grep='grep --color=auto'
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
# PATH
export GOPATH=$HOME/.go
paths=(
$GOPATH/bin
$HOME/.local/bin
$HOME/.cargo/bin
$HOME/.npm-global/bin
)
for X in ${paths[@]}; do
  PATH=$PATH:$X
done
export PATH=$PATH
# .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
# PROMPT_COMMAND
function prompt_command(){
  local TEMP_PWD=`basename $PWD`
  echo -ne "\033]0;${TEMP_PWD/#$HOME/~}\007"
}
PROMPT_COMMAND='prompt_command'
# Look at https://github.com/justjanne/powerline-go#customization
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -cwd-mode plain\
                                    -mode flame\
                                    -modules "venv,user,ssh,cwd,perms,git,hg,jobs,exit,root,vgo"\
                                    -theme "solarized-dark16"\
                                    -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# bash history
HISTSIZE=10000
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

# java path
export JAVA_HOME=`/usr/libexec/java_home -v 11`
