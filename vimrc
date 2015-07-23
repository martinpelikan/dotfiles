call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'bps/vim-textobj-python'
Plug 'bruno-/vim-man'
Plug 'christoomey/vim-sort-motion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'henrik/vim-indexed-search'
Plug 'hynek/vim-python-pep8-indent'
Plug 'JCLiang/vim-cscope-utils'
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'matze/vim-move'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'python-rope/ropevim', { 'on': 'RopeOpenProject' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yssl/VIntSearch'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" =========================  Built-in Variables  =========================
" Initialize Solarized
set background=dark
colorscheme solarized
" Enable persistent undo (basically a whole VCS). Move clutter out of pwd
set undofile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" default of 4000ms is a bit too slow for gitgutter
set updatetime=750
" Use \C or PartialCaps to ensure case sensitive searches
set ignorecase
set smartcase
" Misc. useful settings
set cursorline
set hlsearch
set number
set relativenumber
set title
" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" The mouse does more harm than good
set mouse=
" Fancy ctag / cscope stuff
set cscopetag
set csto=1
" Should not match pyc files, or other clutter for that matter
set wildignore+=*.pyc,*.bak,*/tmp/*,*.so,*.swp,*.zip

" =========================  Plugin Variables  =========================
" Buffers > Tabs, once you can see them
let g:airline#extensions#tabline#enabled = 1
" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_modified_removed = '●✘'
let g:gitgutter_sign_removed = '✘_'
let g:gitgutter_sign_removed_first_line = '✘‾'
" Open quicklist on F12 for lint issues
let g:neomake_open_list = 2
" Supplement YCM's completion options with tags/syntax
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Only set motions I'll remember
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" Quicker matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Folding is terrible even for markdown files
let g:vim_markdown_folding_disabled=1
" Make all sorts case insensitive and remove duplicates
let g:sort_motion_flags = "ui"
" Do project-wide searches with ag.vim
let g:ag_working_path_mode="r"

" =========================  Normal Mode Mappings  =========================
" EasyMotion substitute, up, down
nn s <Plug>(easymotion-s2)
nn <Leader>j <Plug>(easymotion-j)
nn <Leader>k <Plug>(easymotion-k)
" When ctags fail ...
nn <leader>jd :YcmCompleter GoTo<CR>
" CtrlP for tagfiles
nn <M-]> :CtrlPTag<CR>
" We basically have an IDE now
nn <Leader>b :TagbarToggle<CR>
" VIntSearch
nn <M-t> :VIntSearchMoveBackward<CR>
nn <M-T> :VIntSearchMoveForward<CR>
nn <M-p> :silent! VScprev<CR>
nn <M-n> :silent! VScnext<CR>
nn g\ :VIntSearchGrepCursor n l<CR><CR>
" Silver searcher
nn <M-f> :Ag<CR>
" Cscope shortcuts
nn <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nn <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nn <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nn <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nn <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nn <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nn <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nn <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" F-key bindings
nn <F12> :Neomake<CR>
" Until ex mode dies in a fire: https://github.com/neovim/neovim/issues/1089
nn Q :qa<CR>

" =========================  Visual Mode Mappings  =========================
vn g\ :<C-u>VIntSearchGrepCursor v l<CR><CR>

" =========================  FileType Behaviours  =========================
au FileType python,html,xhtml,css,javascript set list listchars=tab:<-
" You shall not pass! ... this v-line if you are pep8 compliant
au FileType python set colorcolumn=80
" Remember the last cursor position, but not for gitcommit files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif

" =========================  Special File Syntax  =========================
au BufNewFile,BufRead *.tac,master.cfg setlocal ft=python
au BufNewFile,BufRead README setlocal ft=rst
