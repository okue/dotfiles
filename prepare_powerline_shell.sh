#! /bin/bash

POWERLINEGO=~/.go/src/github.com/justjanne/powerline-go/

go get -u github.com/justjanne/powerline-go
cd $POWERLINEGO && git apply ~/dotfiles/diff.patch && go install
