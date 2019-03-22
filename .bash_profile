# lang, locale
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANG=ja_JP.utf8
alias vi='vim'
alias l='ls'
alias grep='grep --color=auto'
# texbin
PATH=$PATH:/Library/TeX/texbin
# prolog
alias prolog='swipl'
# node
export NODE_PATH=/usr/local/lib/node_modules/npm/bin
eval "$(rbenv init -)"
# lsの色
alias ls='ls -G'
alias ll='ls -hl'
# terminal.app用？
export LSCOLORS=gxfxcxdxbxegedabagacad
alias f="open ."
# tab
alias la="ls -a"
alias g++='g++ --std=c++11'
# stack, haskell
eval "$(stack --bash-completion-script stack)"
alias ghc="stack ghc --"
alias ghci="stack ghci --"
alias runhaskell="stack runghc --"
alias runghc="stack runghc --"
alias gitpushall="git add . && git commit -m 'update' && git push"
alias cd_icloud="cd ~/Library/Mobile\ Documents/3L68KQB4HG~com~readdle~CommonDocuments/Documents"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/.bash-completion-files/.haskyapi.bash
source ~/.bash-completion-files/.truffle.bash
source ~/.bash-completion-files/.git-completion.bash
source ~/.bash-completion-files/.sbt-scala.bash
source ~/.bash-completion-files/.rebar3.bash
source ~/.bash-completion-files/.make.bash

paths=(
/usr/local/opt/llvm/bin
/usr/local/Cellar/node/11.3.0_1/bin
$HOME/programming/Storage/go2aws/bin
$HOME/.local/bin
$HOME/.cargo/bin
$HOME/work/LCM/pgsolver/bin
)
for X in ${paths[@]}; do
  PATH=$PATH:$X
done
export PATH=$PATH
[ -f ~/.bashrc ] && . ~/.bashrc
function prompt_command(){
  local TEMP_PWD=`basename $PWD`
  echo -ne "\033]0;${TEMP_PWD/#$HOME/~}\007"
}
PROMPT_COMMAND='prompt_command'
##########################################################################
# [ -f ~/.bash_powerline ] && . ~/.bash_powerline
# PS1="\[\033[31m\]\u\[\033[0m\]\[\033[32m\] \W\[\033[0m\] 卍 "
##########################################################################
# pip3 install powerline-shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
##########################################################################
