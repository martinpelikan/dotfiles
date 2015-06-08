call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'python-rope/ropevim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'vim-javascript'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = '●✘'
let g:airline#extensions#tabline#enabled = 1

" Open quicklist to see issues
let g:neomake_open_list = 1

" Initialize Solarized
set background=dark
colorscheme solarized

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Why not, slightly more helpful title
set title

" Tabs are evil, make them obvious.
autocmd FileType python,html,xhtml,css,javascript set list listchars=tab:<-

" Line numbers help a fair bit.
set number

" Highlight words that are searched.
set hlsearch

" Be case sensitive only when search expression contains an upper case character
" When using search and replace, use \C to ensure case sensitivity
set ignorecase
set smartcase

" Draw a line at 79 characters for Python.
autocmd FileType python set colorcolumn=79

" Highlight the current cursor line
set cursorline

" Use F5 to toggle Gundo
nnoremap <F5> <ESC>:GundoToggle<CR>

" Jump to definition
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable persistent undo. Move clutter files out of pwd
set undofile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <F12> <ESC>:Neomake<CR>

au BufNewFile,BufRead master.cfg setlocal ft=python
