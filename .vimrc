" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" Show line numbers
set number

" Encoding
set encoding=utf-8


set showcmd             " show command in bottom bar

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Allow word wrapping, but only line break when enter is pressed
set wrap
set linebreak
set nolist " list disables linebreak

" Prevent vim from automatically inserting line breaks in newly entered text
set textwidth=0
set wrapmargin=0

set autoindent "Auto indent
set smartindent "Smart indent
set cindent "Stricter rules for c programs

" Add a blank line below by pressing <Enter>
map <Enter> o<ESC>

" Copy to system clipboard
set clipboard=unnamedplus
