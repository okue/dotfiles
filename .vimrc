syntax on
colorscheme molokai
set nocompatible
set backspace=indent,eol,start
set ts=2 sw=2 noet
set ambiwidth=double " 全角文字
" set guifont=Cica:h16
" set printfont=Cica:h12
set t_Co=256
set encoding=UTF-8
set synmaxcol=200
set number           " 行番号を表示する
" カーソルの行, 列のハイライトは, かなりもっさりする
" set cursorline       " カーソル行の背景色を変える
" set cursorcolumn     " カーソル位置のカラムの背景色を変える
set laststatus=2     " ステータス行を常に表示
set cmdheight=2      " メッセージ表示欄を2行確保
set showmatch        " 対応する括弧を強調表示
set helpheight=999   " ヘルプを画面いっぱいに開く
set list             " 不可視文字を表示
set scrolloff=8      " 上下8行の視界を確保
set sidescrolloff=16 " 左右スクロール時の視界を確保
set sidescroll=1     " 左右スクロールは一文字づつ行う
set confirm          " 保存されていないファイルがあるときは終了前に保存確認
set hidden           " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread         " 外部でファイルに変更がされた場合は読みなおす
set nobackup         " ファイル保存時にバックアップファイルを作らない
set noswapfile       " ファイル編集中にスワップファイルを作らない
set hlsearch         " 検索文字列をハイライトする
set incsearch        " インクリメンタルサーチを行う
set ignorecase       " 大文字と小文字を区別しない
set smartcase        " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan         " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault         " 置換の時 g オプションをデフォルトで有効にする
set expandtab        " タブ入力を複数の空白入力に置き換える
set tabstop=4        " 画面上でタブ文字が占める幅
set shiftwidth=4     " 自動インデントでずれる幅
set softtabstop=4    " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent      " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set autoindent       " 改行時に前の行のインデントを継続する
set history=100      " コマンドラインの履歴を100件保存する
set mouse=a          " マウスの入力を受け付ける
set visualbell t_vb= " ビープ音すべてを無効にする
set noerrorbells     " エラーメッセージの表示時にビープを鳴らさない
:set noundofile      " .unファイルを作らない
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ " 不可視文字の表示記号指定
set clipboard=unnamed,unnamedplus,autoselect     " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set wildmenu wildmode=list:longest,full          " コマンドラインモードでTABキーによるファイル名補完を有効にする

" file type ------------------------------------------------
au BufNewFile,BufRead *.elm   setf elm
au BufNewFile,BufRead *.scala setf scala
au BufNewFile,BufRead *.fr    setf frege
au BufNewFile,BufRead *.z3    setf z3
au BufNewFile,BufRead *.gd    setf GD
au BufNewFile,BufRead *.ts    setf typescript
au BufNewFile,BufRead *.kt    setf kotlin
au BufNewFile,BufRead *.sol   setf solidity
au BufNewFile,BufRead *.rs    setf rust
au BufNewFile,BufRead *.tex   setf tex

" build関連 ------------------------------------------------
autocmd FileType haskell    map <F4> :w \|!stack runghc %<CR>
autocmd FileType haskell    map <F5> :w \|!hlint %<CR>
autocmd FileType ocaml      map <F4> :w \|!ocaml %<CR>
autocmd FileType ocaml      map <F5> :!ocamlc -i %<CR>
autocmd FileType rust       map <F4> :w \|!rustc -o a.out %<CR>
autocmd FileType rust       map <F5> :! ./a.out<CR>
autocmd FileType ruby       map <F4> :w \|!ruby %<CR>
autocmd FileType go         map <F4> :w \|!go run %<CR>
autocmd FileType cpp        map <F4> :w \|!g++-7 --std=c++17 %<CR>
autocmd FileType cpp        map <F5> :!./a.out <CR>
autocmd FileType c          map <F4> :w \|!gcc-7 %<CR>
autocmd FileType c          map <F5> :!./a.out <CR>
autocmd FileType python     map <F4> :w \|!python3.6 %<CR>
autocmd FileType tex        map <F4> :w \| :!texc %<CR>
autocmd FileType scala      map <F4> :w \| :!scala %<CR>
autocmd FileType erlang     map <F4> :w \| :!escript %<CR>
autocmd FileType erlang     map <F5> :w \| :!dialyzer %<CR>
autocmd FileType z3         map <F4> :w \| :!z3 %<CR>
autocmd FileType z3         set syntax=lisp
autocmd FileType GD         set syntax=haskell
autocmd FileType frege      set syntax=haskell
autocmd FileType sh         map <F4> :w \| :!./%<CR>
autocmd FileType typescript map <F4> :w \| :!tsc %<CR>
autocmd FileType javascript map <F4> :w \| :!node %<CR>

" key bindings ---------------------------------------------
nnoremap ; :
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap s <C-w>

" dein.vim setting -----------------------------------------
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand('~/.vim/dein/toml')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
