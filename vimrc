" dont try to be vi
set nocompatible

" fix capital O delay
set noesckeys

" leader mapping
let mapleader = ","
set showcmd

filetype plugin indent on

set undodir=$XDG_DATA_HOME/vim/undo//
set directory=$XDG_DATA_HOME/vim/swap//
set backupdir=$XDG_DATA_HOME/vim/backup//
set viewdir=$XDG_DATA_HOME/vim/view//
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

" syntax hightlighting
syntax on

" fix backspace issues
set backspace=indent,eol,start

" indenting
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

" leader map
nnoremap <Leader>; A;<esc>

" auto closing brackets
inoremap "" ""<left>
inoremap '' ''<left>
inoremap () ()<left>
inoremap (<cr> (<cr>)<esc>O
inoremap (;<cr> (<cr>);<esc>O

inoremap [] []<left>
inoremap [<cr> [<cr>]<esc>O
inoremap [;<cr> [<cr>];<esc>O

inoremap {} {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O

" plugins
call plug#begin('$XDG_DATA_HOME/vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'junegunn/goyo.vim'

call plug#end()

colorscheme nord

call coc#config("rust-analyzer.diagnostics.disabled", ["unresolved-import"])

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Trigger completion with <tab>
" found in :help completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" rustfmt on save
let g:rustfmt_autosave = 1

" goyo configs
let g:goyo_linenr = 1

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
