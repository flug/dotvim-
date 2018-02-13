call plug#begin("~/.vim/plugged")

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/bkad/CamelCaseMotion.git'
Plug 'https://github.com/vim-scripts/auto_mkdir.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'craigemery/vim-autotag'


call plug#end()
syntax on 

let mapleader = "ç"

set encoding=utf-8
set relativenumber
set number
set undofile
set backspace=indent,eol,start
set ignorecase
set smartcase
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
" }

map <C-n> :NERDTreeToggle<CR>

let &colorcolumn="80"

let g:airline_theme='minimalist'
