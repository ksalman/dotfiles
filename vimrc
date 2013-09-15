"====================VIMRC====================
let $MYVIMRC = '$HOME/dotfiles/vimrc'


"====================map leader====================
let mapleader = ","

let s:ruby_path = 'C:\Ruby192\bin'
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
 " vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Solarized'
 " non github repos
Bundle 'git://git.wincent.com/command-t.git'

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

