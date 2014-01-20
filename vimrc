set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Sleek git integration
Bundle 'tpope/vim-fugitive'
" 16 colour 4 life
Bundle 'altercation/vim-colors-solarized'
" Recursive file search via partial strings
Bundle 'kien/ctrlp.vim'
" Best auto-completer ever
Bundle 'Valloric/YouCompleteMe'
" Nice file explorer 
Bundle 'scrooloose/nerdtree'
" The above, in a small side panel
Bundle 'jistr/vim-nerdtree-tabs'
" Visual illustration of un/re-do history
Bundle 'sjl/gundo.vim'
" Python linter
Bundle 'nvie/vim-flake8'
" Slightly smarter indentations for 'gq'
Bundle 'hynek/vim-python-pep8-indent'
" Add/change surroundings of text blocks
Bundle 'tpope/vim-surround'
" For a less horrible HTML editing time
Bundle "mattn/emmet-vim"

" Possibly enable later
" Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on     " required!

" Initialize Solarized
syntax enable
set background=dark
colorscheme solarized
set t_Co=16

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
" When using search and replace, use \C to ensure case sensitive
" searches/replacements 
set ignorecase
set smartcase

" Backspace should not suck.
set backspace=indent,eol,start

" Always have NERDtree running
let g:nerdtree_tabs_open_on_console_startup=1

" Use F5 to toggle Gundo
nnoremap <F5> :GundoToggle<CR>

" Remove trailing whitespaces when saving a .py file
autocmd BufWritePre *.py :%s/\s\+$//e

" Jump to definition 
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
