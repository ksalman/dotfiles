" Neovim

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" Keymap
let mapleader = ","
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
map <C-k> <C-w><up>
map <C-j> <C-w><down>
map <C-h> <C-w><left>
map <C-l> <C-w><right>

" Let me switch buffers without saving the current one
set hidden

" When scrolling, keep the cursor 8 lines from the top and the bottom
set scrolloff=8

set number
set relativenumber
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
