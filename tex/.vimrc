let mapleader=' '
let maplocalleader = ' '

filetype on
syntax on
set autoindent autoread background=dark
set backspace=indent,eol,start belloff=all
set hidden
set ignorecase
set smartcase
set encoding=utf-8
set history=10000
set scrolloff=10
" set hlsearch
" set incsearch
" set number
" set relativenumber

set undodir=~/.local/state/vim/undo// undofile
highlight LineNr ctermfg=DarkGrey

nnoremap <leader>tn :set rnu! nu!<CR>
nnoremap <leader>tw :set wrap!<CR>


" [[ Basic Keymaps ]]

nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>


" [[ Install `vim-plug` plugin manager ]]
"    See https://github.com/junegunn/vim-plug/ for more info
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sleuth' " Detect tabstop and shiftwidth automatically
Plug 'tpope/vim-commentary'
" Plug 'justinmk/vim-dirvish'

" Adds git related signs to the gutter
" Plug 'airblade/vim-gitgutter'

" Useful plugin to show you pending keybinds.
" Plug 'liuchengxu/vim-which-key'

" Enable LSP
" Plug 'prabirshrestha/vim-lsp'
" Install language servers and configure them for vim-lsp
" Plug 'mattn/vim-lsp-settings'

" Autocompletion
"Plug 'prabirshrestha/asyncomplete.vim'
" Use <Tab> to auto complete
" Plug 'ervandew/supertab'

call plug#end()
filetype plugin on

let g:netrw_banner = 0     " Hide annoying 'help' banner
let g:netrw_liststyle = 3  " Use tree view
nnoremap - :Rexplore<CR>

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx


" vim: ts=2 sts=2 sw=2 et


