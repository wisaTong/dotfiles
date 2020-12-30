" dont try to be vi
set nocompatible

filetype plugin on

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

