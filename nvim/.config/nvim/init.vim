set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=
set hidden
set relativenumber
set number
set nowrap
set smartcase
set ignorecase
set nohlsearch
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=88
set signcolumn=yes
set noerrorbells

call plug#begin('~/.vim/plugged')
" Telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Black formatter for Python dev
Plug 'psf/black'

" lua development
Plug 'tjdevries/nlua.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'Glench/Vim-Jinja2-Syntax'

call plug#end()

" Italics need to be set before setting colorscheme
let g:gruvbox_italic=1
colorscheme gruvbox
highlight Normal guibg=none
"
let mapleader = " "
" Requires vim-telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fd :lua require'telescope.builtin'.find_files {cwd = "~/.config",follow=true}<CR>

" Paste without putting things in unnamed register
xnoremap <leader>p "_dP

nnoremap <leader>lr :lua vim.lsp.buf.rename()<CR>
" Requires vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gg :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
" Requires fzf-checkout
nnoremap <leader>gc :GCheckout<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS = '--reverse'
" Autocomplete strategy - Requires completion-nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Requires vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" Update sign column every quarter second - to update gitgutter signs quickly
set updatetime=250

" Python development
" Create a venv and install pynvim, and set the following variable
" :help python-virtualenv
let g:python3_host_prog = '~/.vim/pynvim/bin/python3'
" brew install pyright
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach}
" brew install terraform-ls
lua require'lspconfig'.terraformls.setup{ on_attach=require'completion'.on_attach}
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting()

" LSP
" Get attached clients, run this command from vim
" lua print(vim.inspect(vim.lsp.buf_get_clients()))
" Also try "checkhealth" and "LspInfo" commands

" Run Black formatter on Python files
" Requires psf/black
autocmd BufWritePre *.py silent execute ':Black'

lua <<EOF
  require'lspconfig'.terraformls.setup{}
EOF
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

augroup ksalman
    autocmd!
    " Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

lua require('ksalman')
