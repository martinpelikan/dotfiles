call plug#begin('~/.config/nvim/plugged')
Plug '/usr/share/vim/vimfiles/' " FZF support, installed via package manager
Plug 'vim-scripts/deb.vim'
Plug 'Konfekt/FastFold'
Plug 'Konfekt/FoldText'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline'
Plug 'bps/vim-textobj-python'
Plug 'christoomey/vim-sort-motion'
Plug 'dag/vim-fish'
Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'godlygeek/tabular'
Plug 'henrik/vim-indexed-search'
Plug 'hynek/vim-python-pep8-indent'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'shime/vim-livedown'
Plug 'simnalamburt/vim-mundo'
Plug 'tell-k/vim-autopep8'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'zchee/deoplete-jedi'
call plug#end()

set termguicolors
set background=dark
colorscheme solarized

" Folding
set foldlevel=1
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" Buffers > Tabs, once you can see them
let g:airline#extensions#tabline#enabled = 1
" Use the pretty fonts
let g:airline_powerline_fonts = 1
" Folding is terrible even for markdown files
let g:vim_markdown_folding_disabled=1
" Make all sorts case insensitive and remove duplicates
let g:sort_motion_flags = "ui"
" Avoid some useless stdlib errors
let g:ale_lint_on_insert_leave = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
" Have Jedi for goto's but don't conflict with deoplete
let g:jedi#completions_enabled = 0
" Enable deoplete completion
let g:deoplete#enable_at_startup = 1
" Signify, only use git
let g:signify_vcs_list = ['git']

" Ag with file preview toggled by '?'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" List files with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" FZF theming
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Ripgrep with FZF (slower than Ag for some reason?)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
