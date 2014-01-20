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
" Slightly smarter indentations for 'gq'
Bundle 'hynek/vim-python-pep8-indent'
" Add/change surroundings of text blocks
Bundle 'tpope/vim-surround'
" For a less horrible HTML editing time
Bundle "mattn/emmet-vim"
" Runs various installed linters/checkers based on file type
Bundle "scrooloose/syntastic"
" Various convenient shortcuts for cycling/others
Bundle "tpope/vim-unimpaired"
" Redundant whitespaces are redundant
Bundle "bitc/vim-bad-whitespace"

" Possibly enable later
" Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on     " required!

" Initialize Solarized
syntax enable
set background=dark
colorscheme solarized
set t_Co=16

" Make powerline's statusline show up on start, without splits
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

" Tabs are evil, make them obvious.
set list listchars=tab:<-

" Line numbers help a fair bit.
set number

" Highlight words that are searched.
set hlsearch

" Search as you type.
set incsearch

" Be case sensitive only when search expression contains an upper case character
" When using search and replace, use \C to ensure case sensitivity
set ignorecase
set smartcase

" Keep five lines of context above/below the cursor.
set scrolloff=5

" Draw a line at 79 characters for Python.
autocmd FileType python set colorcolumn=79

" Highlight the current cursor line
set cursorline

" Backspace should not suck.
set backspace=indent,eol,start

" Always have NERDtree running
let g:nerdtree_tabs_open_on_console_startup=1

" Use F5 to toggle Gundo
nnoremap <F5> <ESC>:GundoToggle<CR>

" Remove trailing whitespaces when saving a .py file
autocmd BufWritePre *.py :%s/\s\+$//e

" Jump to definition
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Run a linter/syntax checker with F12
nnoremap <F12> <ESC>:SyntasticCheck<CR>
" And list the Errors generated above with Ctrl + F12
nnoremap <C-F12> <ESC>:Errors<CR>

" Lint on write is annoying, use F12 instead.
let g:syntastic_mode_map = {'mode': 'passive'}
