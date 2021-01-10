" dont try to be vi
set nocompatible

filetype plugin on

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
call plug#begin('~/.conf/vim/plugged')

Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord
