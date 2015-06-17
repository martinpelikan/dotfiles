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
Plug 'majutsushi/tagbar'
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'vim-javascript'
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

" Spacing and indenting settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType python,html,xhtml,css,javascript set list listchars=tab:<-

" Enable persistent undo. Move clutter files out of pwd
set undofile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Be case sensitive only when search expression contains an upper case character
" When using search and replace, use \C to ensure case sensitivity
set ignorecase
set smartcase

" Misc. useful settings
set title
set number
set hlsearch
set cursorline
set spell

" You shall not pass! ... this v-line if you are pep8 compliant
autocmd FileType python set colorcolumn=80

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Be honest about their filetypes.
au BufNewFile,BufRead master.cfg setlocal ft=python
au BufNewFile,BufRead README setlocal ft=rst

" Use the pretty fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_modified_removed = '●✘'

" Easymotion minimal vimrc
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" Open quicklist to see issues
let g:neomake_open_list = 1

" Maps
nmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nnoremap <F5> <ESC>:GundoToggle<CR>
nnoremap <F12> <ESC>:Neomake<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <Leader>b :TagbarToggle<CR>

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
autocmd FileType python let b:easytags_auto_highlight = 0

" VIntSearch
function! s:nnoreicmap(option, shortcut, command)
    execute 'nnoremap '.a:option.' '.a:shortcut.' '.a:command
    execute 'imap '.a:option.' '.a:shortcut.' <Esc>'.a:shortcut
    execute 'cmap '.a:option.' '.a:shortcut.' <Esc>'.a:shortcut
endfunction

call s:nnoreicmap('','<A-t>',':VIntSearchMoveBackward<CR>')
call s:nnoreicmap('','<A-T>',':VIntSearchMoveForward<CR>')

call s:nnoreicmap('','<A-]>',':VIntSearchCtagsCursor n j<CR>')
call s:nnoreicmap('','g]',':VIntSearchCtagsCursor n l<CR>')
call s:nnoreicmap('','g\',':VIntSearchGrepCursor n l<CR><CR>')
vnoremap <A-]> :<C-u>VIntSearchCtagsCursor v j<CR>
vnoremap g] :<C-u>VIntSearchCtagsCursor v l<CR>
vnoremap g\ :<C-u>VIntSearchGrepCursor v l<CR><CR>

call s:nnoreicmap('','g\|',':VIntSearchCFGrepCursor n l<CR><CR>')
vnoremap g\| :<C-u>VIntSearchCFGrepCursor v l<CR><CR>

call s:nnoreicmap('','<F8>',':VScnext<CR>')
call s:nnoreicmap('','<S-F8>',':VScprev<CR>')
