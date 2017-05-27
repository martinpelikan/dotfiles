call plug#begin('~/.config/nvim/plugged')
Plug '/usr/share/vim/vimfiles/' " FZF support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'bps/vim-textobj-python'
Plug 'christoomey/vim-sort-motion'
Plug 'dag/vim-fish'
Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'godlygeek/tabular'
Plug 'henrik/vim-indexed-search'
Plug 'hynek/vim-python-pep8-indent'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'shime/vim-livedown'
Plug 'simnalamburt/vim-mundo'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
call plug#end()

colorscheme solarized
" Enable deoplete
let g:deoplete#enable_at_startup = 1
" Buffers > Tabs, once you can see them
let g:airline#extensions#tabline#enabled = 1
" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_modified_removed = '●✘'
let g:gitgutter_sign_removed = '✘_'
let g:gitgutter_sign_removed_first_line = '✘‾'
" Folding is terrible even for markdown files
let g:vim_markdown_folding_disabled=1
" Make all sorts case insensitive and remove duplicates
let g:sort_motion_flags = "ui"
" ALE
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
" Jedi
let g:jedi#completions_enabled = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

