
set showtabline=2
set imdisable
set antialias
set background=dark
set guifont=Monaco:h14    
set transparency=7
set fuoptions=maxvert,maxhorz


" 縦幅　デフォルトは24
set lines=40
" 横幅　デフォルトは80
set columns=120

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif
