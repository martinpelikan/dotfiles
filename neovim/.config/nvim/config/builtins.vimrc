let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
" True colour solarized.
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized
" Enable persistent undo history and backups (basically a whole VCS).
set backup undofile
" Move tempfile clutter out of pwd
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
" Default of 4000ms is a bit too slow for gitgutter
set updatetime=750
" Use \C or PartialCaps to ensure case sensitive searches
set ignorecase smartcase
" Crosshair for finding cursor
set cursorline cursorcolumn
" Highlight search matches. Great with incsearch. Clear with <C-L>
set hlsearch
" Relativenumber is great for <count> vertical motions
set number relativenumber
" Window title is useful with multiple open windows
set title
" Don't use tabs. <tab>=4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" The mouse does more harm than good, disable it.
set mouse=
" Use cscope in addition to ctags for C-]. Search ctag file first (1)
set cscopetag csto=1
" Grep-like tools should not match pyc files, or other clutter for that matter
set wildignore+=*.pyc,*.bak,*/tmp/*,*.so,*.swp,*.zip
