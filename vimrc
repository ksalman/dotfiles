"====================VIMRC====================

let $MYVIMRC = '$HOME/dotfiles/vimrc'


"====================line numbers====================
set number


"====================map leader====================
let mapleader = "\<Space>"


"====================buffers====================
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>

"================increment with alt-a================
set <A-a>=a
nmap <A-a> <C-a>

"====================map leader====================
set visualbell


"====================move between panes====================
map <C-k> <C-w><up>
map <C-j> <C-w><down>
map <C-h> <C-w><left>
map <C-l> <C-w><right>

"====================status line====================
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]


"====================sensible defaults====================
set laststatus=2
set wildmenu
set hidden
set listchars=tab:▸\ ,trail:.,extends:>,precedes:<,nbsp:+,eol:¬
set list


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
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

 " let Vundle manage Vundle
 " required
Plugin 'VundleVim/Vundle.vim'

 " My Bundles here:
 "
 " original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
 " vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Indent-Guides'
Plugin 'ervandew/supertab'
Plugin 'git://github.com/davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'git://github.com/scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
 " NOTE: comments after Bundle command are not allowed..

"====================solarized====================

  set t_Co=16
  syntax enable
  "let g:solarized_termtrans = 1
  "let g:solarized_termcolors=16
  let g:solarized_visibility = "low"
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

"fix error invalid argument completeopt+=noinsert
let g:jedi#completions_enabled = 0

highlight Comment cterm=italic
