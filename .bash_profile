# cabal
PATH="$PATH":"$HOME/.cabal/bin"
# texbin
PATH="$PATH":/Library/TeX/texbin
# prolog
PATH="$PATH":/Applications/SWI-Prolog.app/Contents/MacOS
alias prolog='swipl'
# node
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/purescript/vendor/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/phantomjs/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/casperjs/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/typescript/bin/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/chrome-remote-interface/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/lib/node_modules/lighthouse/
PATH="$PATH":/usr/local/Cellar/node/7.7.3/bin
eval "$(rbenv init -)"
# lsの色
alias ls='ls -G'
alias ll='ls -hl'
# terminal.app用？
export LSCOLORS=gxfxcxdxbxegedabagacad
alias f="open ."
# wget
alias wget="/usr/local/cellar/wget/1.16.3/bin/wget"
# tab
alias tab="expand -t4"
alias la="ls -a"
PS1="\[\033[31m\]\u\[\033[0m\]\[\033[32m\] \W\[\033[0m\] $ "  
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
function tabname(){
    echo -ne "\033]0;$1\007"
}
alias texc='texc'
alias g++='g++ --std=c++11'
eval "$(rbenv init -)"
# macvim --------------------------------------------
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias view='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/view "$@"'
alias vi=vim
# macvimのGUIはmvim
alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# ctags 
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'

export NODE_PATH="/usr/local/lib/node_modules/npm/bin:$PATH"

alias chrome-canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
PATH="$PATH":"/usr/local/opt/llvm/bin"
PATH="$PATH":"$HOME/.local/bin":"$HOME/programming/Storage/go2aws/bin"
PATH="$PATH":"$HOME/Sites/haskyapi/sbin"
