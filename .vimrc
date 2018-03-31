set nocompatible
syntax on
colorscheme molokai
set backspace=indent,eol,start
set ts=2 sw=2 noet
" 全角文字
set ambiwidth=double
set history=100
set t_Co=256
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする
" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus,autoselect
" マウスの入力を受け付ける
set mouse=a
" コマンドラインの設定
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を100件保存する
set history=100

au BufNewFile,BufRead *.elm   setf elm
au BufNewFile,BufRead *.scala setf scala
au BufNewFile,BufRead *.fr    setf frege
au BufNewFile,BufRead *.z3    setf z3
au BufNewFile,BufRead *.gd    setf GD
au BufNewFile,BufRead *.agda  setf agda
au BufNewFile,BufRead *.purs  setf purescript
au BufNewFile,BufRead *.ts    setf typescript
au BufNewFile,BufRead *.sol   setf solidity
au BufNewFile,BufRead *.scr   setf scrapeeee
au BufNewFile,BufRead *.rs    setf rust

" build関連 ------------------------------------------------
autocmd FileType haskell map <F4> :w \|!stack runghc %<CR>
autocmd FileType haskell map <F5> :w \|!hlint %<CR>
autocmd FileType ocaml  map <F4> :w \|!ocaml %<CR>
autocmd FileType ocaml  map <F5> :!ocamlc -i %<CR>
autocmd FileType rust   map <F4> :w \|!rustc -o a.out %<CR>
autocmd FileType rust   map <F5> :! ./a.out<CR>
autocmd FileType ruby   map <F4> :w \|!ruby %<CR>
autocmd FileType cpp    map <F4> :w \|!g++-7 --std=c++17 %<CR>
autocmd FileType c      map <F4> :w \|!gcc-7 %<CR>
autocmd FileType go     map <F4> :w \|!go run %<CR>
autocmd FileType cpp    map <F5> :!./a.out <CR>
autocmd FileType c      map <F5> :!./a.out <CR>
autocmd FileType python map <F4> :w \|!python3.6 %<CR>
autocmd FileType python map <F5> :w \|!mypy %<CR>
autocmd FileType tex    map <F4> :w \| :!texc %<CR>
autocmd FileType scala  map <F4> :w \| :!scala %<CR>
autocmd FileType z3     map <F4> :w \| :!z3 %<CR>
autocmd FileType erlang map <F4> :w \| :!escript %<CR>
autocmd FileType erlang map <F5> :w \| :!dialyzer %<CR>
autocmd FileType z3     set syntax=lisp
autocmd FileType GD     set syntax=haskell
autocmd FileType agda   set syntax=haskell
autocmd FileType frege  set syntax=haskell
autocmd FileType purescript set syntax=haskell
autocmd FileType scrapeeee  set syntax=typescript
autocmd FileType agda       map <F4> :w \| :!agda %<CR>
autocmd FileType typescript map <F4> :w \| :!tsc %<CR>
autocmd FileType sh         map <F4> :w \| :!./%<CR>
autocmd FileType javascript map <F4> :w \| :!node %<CR>
" ----------------------------------------------------------
" .unファイルを作らない
:set noundofile
" normal mode で ; -> : 割り当て
nnoremap ; :
"ビープの設定
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
" ----------------------------------------------------------

" dein.vim setting -----------------------------------------
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/vimfiler')
  " vim version 8 >=
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('tyru/caw.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  " call dein#add('eagletmt/neco-ghc')
  call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
" ---------------------------------------------------------
" deoplete.nvim
let g:deoplete#enable_at_startup = 1
" caw.vim
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap <Leader>, <Plug>(caw:zeropos:toggle)
vmap <Leader>, <Plug>(caw:zeropos:toggle)
" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" deoplete
"   tab, shift+tab で補完候補を移動
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
