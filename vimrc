call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'hynek/vim-python-pep8-indent'
Plug 'JCLiang/vim-cscope-utils'
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace', { 'for': ['python', 'html', 'xhtml']}  " some battles are not worth fighting
Plug 'plasticboy/vim-markdown'
Plug 'python-rope/ropevim', { 'on': ':RopeOpenProject' }
Plug 'rking/ag.vim'
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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yssl/VIntSearch'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" =========================  Built-in Variables  ========================= 
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
" Fancy ctag / cscope stuff
set cscopetag
set csto=0
" CtrlP should not match pyc files, or other clutter for that matter
set wildignore+=*.pyc,*.bak,*/tmp/*,*.so,*.swp,*.zip

" =========================  Plugin Variables  ========================= 
" Buffers > Tabs, once you can see them
let g:airline#extensions#tabline#enabled = 1
" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = '●✘'
" Open quicklist on F12 for lint issues
let g:neomake_open_list = 1
" Supplement YCM's completion options with tags/syntax
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Only set motions I'll remember
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" CtrlP all the things
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git --ignore "**/*.pyc" -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" =========================  Key Mappings  ========================= 
" EasyMotion substitute, up, down
nnoremap s <Plug>(easymotion-s2)
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
" When ctags fail ... 
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" CtrlP for tagfiles
nnoremap <leader>. :CtrlPTag<CR>
" We basically have an IDE now
nnoremap <Leader>b :TagbarToggle<CR>
" VIntSearch command-mode Mappings
nnoremap <M-]> :VIntSearchCtagsCursor n j<CR>
nnoremap <M-t> :VIntSearchMoveBackward<CR>
nnoremap <M-T> :VIntSearchMoveForward<CR>
nnoremap g\ :VIntSearchGrepCursor n l<CR><CR>
nnoremap g] :VIntSearchCtagsCursor n l<CR>
" VIntSearch visual-mode Mappings
vnoremap <M-]> :<C-u>VIntSearchCtagsCursor v j<CR>
vnoremap g\ :<C-u>VIntSearchGrepCursor v l<CR><CR>
vnoremap g] :<C-u>VIntSearchCtagsCursor v l<CR>
" Cscope shortcuts
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
" F-key bindings
nnoremap <F5> :GundoToggle<CR>
nnoremap <F9> :VScnext<CR>
nnoremap <F10> :VScprev<CR>
nnoremap <F12> :Neomake<CR>
" Until ex mode dies in a fire: https://github.com/neovim/neovim/issues/1089
nnoremap Q :qa<CR>

" =========================  FileType Behaviours  ========================= 
autocmd FileType python,html,xhtml,css,javascript set list listchars=tab:<-
" You shall not pass! ... this v-line if you are pep8 compliant
autocmd FileType python set colorcolumn=80
" Remember the last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endi

" =========================  Special File Syntax  ========================= 
autocmd BufNewFile,BufRead master.cfg setlocal ft=python
autocmd BufNewFile,BufRead README setlocal ft=rst
