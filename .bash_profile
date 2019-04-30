# terminal.app用？
export LSCOLORS=gxfxcxdxbxegedabagacad
alias vi='vim'
alias l='ls'
alias ls='ls -G'
alias ll='ls -hl'
alias la="ls -a"
alias grep='grep --color=auto'
alias prolog='swipl'
alias f="open ."
alias g++='g++ --std=c++11'
alias gitpushall="git add . && git commit -m 'update' && git push"
alias cd_icloud="cd ~/Library/Mobile\ Documents/3L68KQB4HG~com~readdle~CommonDocuments/Documents"
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
export NODE_PATH=/usr/local/lib/node_modules/npm/bin
export GOPATH=$HOME/.go
paths=(
/usr/local/opt/llvm/bin
/usr/local/Cellar/node/11.3.0_1/bin
$GOPATH/bin
$HOME/programming/Storage/go2aws/bin
$HOME/.local/bin
$HOME/.cargo/bin
$HOME/work/LCM/pgsolver/bin
/Library/TeX/texbin
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
# PS1="\[\033[31m\]\u\[\033[0m\]\[\033[32m\] \W\[\033[0m\] 卍 "
# Look at https://github.com/justjanne/powerline-go#customization
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -cwd-mode plain\
                                    -mode flame\
                                    -modules "venv,user,ssh,cwd,perms,git,hg,jobs,exit,root,vgo"\
                                    -modules-right "time"\
                                    -theme "solarized-dark16"\
                                    -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# bash history
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend
