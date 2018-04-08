# lang, locale
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANG=ja_JP.utf8
alias vi='vim'
alias grep='grep --color=auto'
# texbin
PATH="$PATH":/Library/TeX/texbin
# prolog
PATH="$PATH":/Applications/SWI-Prolog.app/Contents/MacOS
alias prolog='swipl'
# node
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/phantomjs/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/casperjs/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/typescript/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/bin
eval "$(rbenv init -)"
# lsの色
alias ls='ls -G'
alias ll='ls -hl'
# terminal.app用？
export LSCOLORS=gxfxcxdxbxegedabagacad
alias f="open ."
# tab
alias tab="expand -t4"
alias la="ls -a"
# PS1="\[\033[31m\]\u\[\033[0m\]\[\033[32m\] \W\[\033[0m\] † "
PS1="\[\033[31m\]\u\[\033[0m\]\[\033[32m\] \W\[\033[0m\] λ "
# editor
alias subl="$HOME/applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# LaTex
function texc(){
    platex $1;
    platex $1;
    fname=${1%.*};
    dvipdfmx $fname;
    open $fname.pdf;
    rm *.log;
    rm *.dvi;
    rm *.aux;
}
alias texc='texc'
# function tabname(){
#   echo -ne "\033]0;$1\007"
# }
function prompt_command(){
  local TEMP_PWD=`basename $PWD`
  echo -ne "\033]0;${TEMP_PWD/#$HOME/~}\007"
}
PROMPT_COMMAND='prompt_command'
alias g++='g++ --std=c++11'
eval "$(rbenv init -)"
export NODE_PATH="/usr/local/lib/node_modules/npm/bin:$PATH"
alias chrome-canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
PATH="$PATH":"/usr/local/opt/llvm/bin"
PATH="$PATH":"$HOME/.local/bin":"$HOME/programming/Storage/go2aws/bin"
PATH="$PATH":"$HOME/Sites/haskyapi/sbin"

# stack, haskell
eval "$(stack --bash-completion-script stack)"
alias ghc="stack ghc --"
alias ghci="stack ghci --"
alias runhaskell="stack runghc --"
alias runghc="stack runghc --"
alias gitpushall="git add . && git commit -m 'update' && git push"

source ~/.bash-completion-files/.haskyapi.bash
source ~/.bash-completion-files/.truffle.bash
source ~/.bash-completion-files/.git-completion.bash
source ~/.bash-completion-files/.sbt-scala.bash
source ~/.bash-completion-files/.rebar3.bash
source ~/.bash-completion-files/.make.bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
