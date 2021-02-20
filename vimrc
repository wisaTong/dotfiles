" dont try to be vi
set nocompatible

" fix capital O delay
set noesckeys

filetype plugin indent on

set undodir=$XDG_DATA_HOME/vim/undo//
set directory=$XDG_DATA_HOME/vim/swap//
set backupdir=$XDG_DATA_HOME/vim/backup//
set viewdir=$XDG_DATA_HOME/vim/view//
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

" leader mapping
let mapleader = ","

" syntax hightlighting
syntax on

" fix backspace issues
set backspace=indent,eol,start

" indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" fuzzy find
set path+=**
set wildmenu

" completion
set completeopt=menuone,preview,noinsert

" line numbering
set ruler
set relativenumber
set number

" auto closing brackets
inoremap "" ""<left>
inoremap '' ''<left>
inoremap () ()<left>
inoremap [] []<left>
inoremap {} {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O

" plugins
call plug#begin('$XDG_DATA_HOME/vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

colorscheme nord

" gutentags configs
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ 'tags*',
      \ 'cscope.*',
      \ ]
