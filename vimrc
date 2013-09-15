"====================VIMRC====================
let $MYVIMRC = '$HOME/dotfiles/vimrc'


"====================line numbers====================
set number


"====================map leader====================
let mapleader = ","


"====================vundle config====================
" https://github.com/gmarik/vundle/blob/master/README.md#quick-start

set nocompatible               " be iMproved
filetype off                   " required!

if has('win32') || has('win64')
  set runtimepath+=$HOME/vimfiles/bundle/vundle
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
 " vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Solarized'

filetype plugin indent on     " required!
 " NOTE: comments after Bundle command are not allowed..

"====================solarized====================

syntax enable
set background=dark
colorscheme solarized


"====================make text uppercase====================
" make previous word upper case and get back to entering text

imap <c-u> <esc>viwUea
nmap <c-u> viwU


"====================search options====================

set incsearch
set hlsearch
set ignorecase smartcase


"====================Windows stuff====================
if has('win32') || has('win64')
  " set fond
  set guifont=Consolas:h11

  " Remove Left hand scroll bar to prevent window from unsnapping
  set guioptions-=L

  " Always show tabline, prevents window from unsnapping
  set showtabline=2
endif


"====================tab stuff====================
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2


" lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>
