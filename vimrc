call plug#begin("~/.vim/plugged")

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'sgur/vim-editorconfig'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/dockerfile.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'kaicataldo/material.vim'
Plug 'ryanoasis/vim-devicons'
Plug '~/.fzf'



call plug#end()
syntax on 

let mapleader = "ç"

set nocompatible
set encoding=UTF-8
set relativenumber
set number
set undofile
set backspace=indent,eol,start
set ignorecase
set smartcase
set background=dark
colorscheme material
if (has("termguicolors"))
  set termguicolors
endif

filetype on
filetype plugin on
set t_Co=256

set grepprg=ag\ --ignore-dir\ cache\ --ignore-dir\ var\ --ignore-dir\ .rsync_cache\ --ignore-dir\ web/bundles\ --follow\ --smart-case

autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx
autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown
autocmd BufNewFile,BufReadPost .php_cs set filetype=php

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Key (re)Mappings {
" disable noob keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" @see http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
inoremap <C-c> <Esc><Esc>

"Make moving around windows faster
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
  " FZF
nnoremap <leader>f :FZF<CR>
nnoremap <leader>l :FZF src<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ta :Tags<CR>
" }

map <C-n> :NERDTreeToggle<CR>

let &colorcolumn="80"
let g:editorconfig_local_vimrc = 1
let g:airline_theme='angr'
set rtp+=~/.fzf
set tags+=.git/tags
