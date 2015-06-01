call plug#begin('~/.vim/plugged')
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'
" Vim undo tree visualizer
Plug 'simnalamburt/vim-mundo'
" A nicer Python indentation style for vim.
Plug 'hynek/vim-python-pep8-indent'
" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
" Various convenient shortcuts for cycling/others
Plug 'tpope/vim-unimpaired'
" Redundant whitespaces are redundant
Plug 'ntpeters/vim-better-whitespace'
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
" Less annoying paste
Plug 'ConradIrwin/vim-bracketed-paste'
" vim mode that uses rope library to provide features like python refactorings and code-assists
Plug 'python-rope/ropevim'
" autopep8 plugin for Vim
Plug 'tell-k/vim-autopep8'
" Git status in gutter
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = '●✘'

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
