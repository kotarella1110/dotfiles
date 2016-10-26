"------------------------
" NeoBundle Setting Start
"-------------------------
if has('vim_starting')

    if &compatible
        set nocompatible               " Be iMproved
    endif

    " NeoBundleをインストールしていない場合は、
    " 自動インストールする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
         echo "install neobundle..."
        " neobundle.vimのclone
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif

    " 必須
    set runtimepath+=~/.vim/bundle/neobundle.vim/

endif

" 必須
call neobundle#begin(expand('~/.vim/bundle/')) " Start

    let g:neobundle_default_git_protocol='https'

" 必須
    NeoBundleFetch 'Shougo/neobundle.vim'

    " インストールするBundles
    NeoBundle 'tomasr/molokai'
    NeoBundle 'sickill/vim-monokai'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'scrooloose/nerdtree'
    " インデントに色を付けて見やすくする
    NeoBundle 'nathanaelkane/vim-indent-guides'
    " コメントON/OFFを手軽に実行
    NeoBundle 'tomtom/tcomment_vim'
    " ステータスラインの表示内容を強化
    NeoBundle 'itchyny/lightline.vim'
    " スニッペト
    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    " ファイルの構文エラーをチェック 
    NeoBundle 'scrooloose/syntastic'

call neobundle#end() " End

"colorscheme molokai     " カラースキーマ選択
"colorscheme monokai     " カラースキーマ選択
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

" 起動時に見つかったインストールしていないBundleがある場合は、
" インストールするように求められる
NeoBundleCheck
"-----------------------
" NeoBundle Setting End
"-----------------------

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
set tabstop=4           " タブが占めるスペース数
set shiftwidth=4        " 自動インデントでずれるスペース数
set laststatus=2        " ステータス行を常に表示
set encoding=utf-8      " utf-8にエンコード
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis "自動判別に使用する文字コード
set clipboard=unnamed,autoselect " クリップボード連携
"set list
"set listchars=tab:••,trail:-,eol:┘,extends:»,precedes:«,nbsp:%
highlight VertSplit cterm=NONE ctermfg=234 ctermbg=234 " 分割線の色

"nnoremap <C-l> :tabnext<CR>
"nnoremap <C-h> :tabprevious<CR>
