"------------------------
" vim-plug Setting Start
"-------------------------
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  " vim-plug をインストールしていない場合は、
  " 自動インストールする
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

" 必須
call plug#begin('~/.vim/plugged') " Start
  Plug 'junegunn/vim-plug',
       \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
  " インストールするBundles
  Plug 'altercation/vim-colors-solarized'
  Plug 'scrooloose/nerdtree'
  " インデントに色を付けて見やすくする
  Plug 'nathanaelkane/vim-indent-guides'
  " コメントON/OFFを手軽に実行
  Plug 'tomtom/tcomment_vim'
  " ステータスラインの表示内容を強化
  Plug 'itchyny/lightline.vim'
  " スニッペト
  Plug 'Shougo/neocomplete'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  " ファイルの構文エラーをチェック 
  Plug 'scrooloose/syntastic'
call plug#end() " End

colorscheme solarized   " カラースキーマ選択
set background=dark
syntax on               " 構文に色をつける

" インストール済のBundlesの設定
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" ファイルが指定された場合はNERDTreeを非表示にし、指定なしの場合は表示する設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTreeを表示するコマンドを設定
map <C-n> :NERDTreeToggle<CR>
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level=2
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors=0
" 奇数インデントのガイドカラー
"hi IndentGuidesOdd  ctermbg=236
" 偶数インデントのガイドカラー
"hi IndentGuidesEven ctermbg=237
"let g:indent_guides_color_change_percent = 30
" ガイド幅をインデント幅に合わせる
let g:indent_guides_guide_size = &tabstop

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"  syntasticとlightlineの連携
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'right': [ [ 'syntastic', 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
    \ }
    \ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction


" 必須
filetype plugin indent on

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
"set nocompatible" Use Vim defaults instead of 100% vi compatibility
language C              " 各種メッセージを英語にする

set backspace=2         " more powerful backspacing
set number              " 行番号の表示
set cursorline          " カレント行のハイライト
set showmatch           " 対応する括弧の強調表示
set hlsearch            " 検索文字列のハイライト
set ignorecase          " 大文字と小文字を区別しない
set expandtab           " タブ入力を複数の空白入力に置き換え
set autoindent          " オートインデント
set tabstop=2           " タブが占めるスペース数
set shiftwidth=2        " 自動インデントでずれるスペース数
set laststatus=2        " ステータス行を常に表示
set encoding=utf-8      " utf-8にエンコード
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis "自動判別に使用する文字コード
set clipboard=unnamed,autoselect " クリップボード連携
set shell=/bin/bash\ -l\ -O\ expand_aliases
"set list
"set listchars=tab:••,trail:-,eol:┘,extends:»,precedes:«,nbsp:%
highlight VertSplit cterm=NONE ctermfg=234 ctermbg=234 " 分割線の色

nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
inoremap <silent> jj <ESC>
