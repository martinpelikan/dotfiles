call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'godlygeek/tabular'
Plug 'hynek/vim-python-pep8-indent'
Plug 'JCLiang/vim-cscope-utils'
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xhtml'] }  " not only does it load for every file, it also has default keybindings
Plug 'ntpeters/vim-better-whitespace', { 'for': ['python', 'html', 'xhtml']}  " some battles are not worth fighting
Plug 'plasticboy/vim-markdown'
Plug 'python-rope/ropevim', { 'on': ':RopeOpenProject' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yssl/VIntSearch'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Initialize Solarized
set background=dark
colorscheme solarized

" Enable persistent undo. Move clutter files out of pwd
set undofile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Use \C or PartialCaps to ensure case sensitive searches
set ignorecase
set smartcase

" Misc. useful settings
set cursorline
set hlsearch
set number
set spell
set title

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType python,html,xhtml,css,javascript set list listchars=tab:<-
" You shall not pass! ... this v-line if you are pep8 compliant
autocmd FileType python set colorcolumn=80

" easytags is nice but highlighting is distracting
autocmd FileType python let b:easytags_auto_highlight = 0
" Remember the last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endi

" Be honest about their filetypes.
autocmd BufNewFile,BufRead master.cfg setlocal ft=python
autocmd BufNewFile,BufRead README setlocal ft=rst

" Use the pretty fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = '●✘'

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" Open quicklist to see issues
let g:neomake_open_list = 1

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Does this even do anything?
let g:ropevim_enable_shortcuts = 0
" Async easytag creation
let g:easytags_async = 1

" Maps
nnoremap s <Plug>(easymotion-s2)
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
nnoremap <F5> <ESC>:GundoToggle<CR>
nnoremap <F12> <ESC>:Neomake<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <Leader>b :TagbarToggle<CR>
" Until ex mode is removed forever.
nnoremap Q :qa<CR>
