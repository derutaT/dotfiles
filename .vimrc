"----- NeoBundle -----
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

let g:neobundle_default_git_protocol='https'

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Unite
NeoBundle 'Shougo/unite.vim'
" mru を unite に追加
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim'
" Mustang Color Scheme
NeoBundle 'croaker/mustang-vim'
" tomorrow Color Scheme
NeoBundle 'chriskempson/vim-tomorrow-theme'
" hybrid Color Scheme
NeoBundle 'w0ng/vim-hybrid'
" 
NeoBundle 'ujihisa/unite-colorscheme'
" Git を操作
" NeoBundle 'tpope/vim-fugitive'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'elzr/vim-json'
NeoBundle '5t111111/neat-json.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"----- NeoBundle -----

"----- copy from system default file /etc/vim/vimrc -----
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing
set textwidth=0   " Don't wrap lines by default
set nobackup    " Don't keep a backup file
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than
      " 50 lines of registers
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set autoindent
"----- end of system default -----



" 行番号を表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 現在の行をハイライト
" set cursorline
" 検索をループしない様に
set nowrapscan
" 検索にマッチした内容ををハイライト
set hlsearch

" 
set tabstop=2
" Tabをスペースで挿入
set expandtab
" インデントのサイズ
set shiftwidth=2

" 文字コードと改行コードをステータスバーに表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

syntax on

" color scheme
colorscheme Tomorrow-Night

" ------  Unite 設定 -------
""" unite.vim {{{
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup' 
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_file_mru_limit = 100

" ### Key Map ###

" バッファ一覧
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,h :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" レジスタ一覧
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
" yank 一覧
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
"nnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:.  -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite-outline
"nnoremap <silent> ,uo :<C-u>Unite -vertical outline<CR>

" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" }}}

" ------  Unite 設定 -------

" Json を整形するために jq アプリを利用する
" :Jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction
