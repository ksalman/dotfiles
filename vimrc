"====================VIMRC====================
let $MYVIMRC = '$HOME/dotfiles/vimrc'


"====================line numbers====================
set number


"====================map leader====================
let mapleader = ","


"====================map leader====================
set visualbell


"====================status line====================
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]


"====================Always show status line====================
set laststatus=2


"====================Scroll option====================
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8



"====================Allow saving of files as sudo====================
cmap w!! w !sudo tee % > /dev/null

if version >= 703
  set colorcolumn=80 " highlight the 80th column
  set relativenumber " absolute line number are in statusbar anyway
endif


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
Bundle 'Indent-Guides'
Bundle 'ervandew/supertab'
Bundle 'git://github.com/davidhalter/jedi-vim'

filetype plugin indent on     " required!
 " NOTE: comments after Bundle command are not allowed..

"====================solarized====================

  syntax enable
  set t_Co=16
  set background=dark
  colorscheme solarized
  
if has("gui_running")
  function! ToggleBackground()
    if (w:solarized_style=="dark")
      let w:solarized_style="light"
      colorscheme solarized
    else
      let w:solarized_style="dark"
      colorscheme solarized
    endif
  endfunction
  command! Togbg call ToggleBackground()
  nnoremap <F5> :call ToggleBackground()<CR>
  inoremap <F5> <ESC>:call ToggleBackground()<CR>a
  vnoremap <F5> <ESC>:call ToggleBackground()<CR>
else
  highlight Pmenu ctermbg=238
endif


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
  " set font
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
