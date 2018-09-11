call plug#begin("~/.vim/plugged")

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/dockerfile.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'kaicataldo/material.vim'
Plug 'ryanoasis/vim-devicons' 
Plug '2072/PHP-Indenting-for-VIm'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'phpactor/phpactor'

Plug '~/.fzf'

call plug#end()
syntax on 

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

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
autocmd FileType php setlocal omnifunc=phpactor#Complete

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


let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:airline_theme='angr'
set rtp+=~/.fzf
set tags+=.git/tags
let NERDTreeShowHidden=1
set expandtab
set tabstop=4
let g:phpactorBranch = "dev"
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
