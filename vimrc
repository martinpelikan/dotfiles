set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'sjl/gundo.vim'

filetype plugin indent on     " required!

                        """"""""""""""""""""""""""""""
                        " BEGIN MartinPelikan vimrc  "
                        "                            "
                        """"""""""""""""""""""""""""""

" Initialize Solarized
syntax enable
set background=dark
colorscheme solarized
set t_Co=16

" Save keystrokes, only one leader for easymotion
" Remove if another plugin requires \
let g:EasyMotion_leader_key = '<Leader>'

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

" Some numbers and highlighting for clarity
set hlsearch
set number

" Make powerline's statusline show up on start, without splits
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Be case sensitive only when search expression contains an upper case character
" When using search and replace, use \C to ensure case sensitive replacements
set ignorecase
set smartcase

" TODO This disables pymode's folding, in the future make it only fold certain
" sections with different colours
let g:pymode_folding = 0

" Backspace should not suck.
set backspace=indent,eol,start

" Always have NERDtree running
let g:nerdtree_tabs_open_on_console_startup=1
