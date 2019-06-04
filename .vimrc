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

" Synchronize clipboard with vim register
set clipboard^=unnamed

"------------------------------------------------------------ 
" PLUGINS
"------------------------------------------------------------

" Automatic installation of vim-plug
" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Install https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'

" Configuration variables for working with java script
let g:javascript_plugin_jsdoc = 1 " Enables syntax highlighting for JSDocs
let g:javascript_plugin_ngdoc = 1 " Enables some additonal syntax highlighting for NGDocs
let g:javascript_plugin_flow = 1 " Enables syntax highlighting for Flow
