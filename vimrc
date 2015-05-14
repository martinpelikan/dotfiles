call plug#begin('~/.vim/plugged')
" fugitive.vim: a Git wrapper so awesome, it should be illegal<F37>
Plug 'tpope/vim-fugitive'
" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
" Best auto-completer ever
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" Nice file explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" The above, in a small side panel
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
" Git aware nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" sjl/gundo is MIA, use nvim supporting fork:
Plug 'simnalamburt/vim-mundo'
" Slightly smarter indentations for 'gq'
Plug 'hynek/vim-python-pep8-indent'
" Add/change surroundings of text blocks
Plug 'tpope/vim-surround'
" For a less horrible HTML editing time
Plug 'mattn/emmet-vim'
" Various convenient shortcuts for cycling/others
Plug 'tpope/vim-unimpaired'
" Redundant whitespaces are redundant
Plug 'bitc/vim-bad-whitespace'
" Less insane indentations/syntax for JS
Plug 'vim-javascript'
" Syntax for MarkDown files.
Plug 'plasticboy/vim-markdown'
" Sensible defaults
Plug 'tpope/vim-sensible'
" Powerline usage in statusline
Plug 'bling/vim-airline'
" A plugin for asynchronous :make using Neovim's job-control functionality
Plug 'benekastah/neomake'
" Runs various installed linters/checkers based on file type
" Plug 'scrooloose/syntastic'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:airline_powerline_fonts = 1
let g:neomake_open_list = 1

" Initialize Solarized
set background=dark
colorscheme solarized

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" Close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <F12> <ESC>:Neomake<CR>
