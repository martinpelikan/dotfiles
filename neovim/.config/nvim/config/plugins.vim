if &compatible
  set nocompatible
endif

set rtp+=/usr/share/vim/vimfiles

if dein#load_state('~/.cache/dein')
  call dein#begin(expand('~/.cache/dein'))

  call dein#add('/usr/share/vim/vimfiles/')
  call dein#add('vim-scripts/deb.vim')
  call dein#add('Konfekt/FastFold')
  call dein#add('Konfekt/FoldText')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('bling/vim-airline')
  call dein#add('bps/vim-textobj-python')
  call dein#add('christoomey/vim-sort-motion')
  call dein#add('dag/vim-fish')
  call dein#add('davidhalter/jedi')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  call dein#add('godlygeek/tabular')
  call dein#add('henrik/vim-indexed-search')
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('junegunn/fzf.vim')
  call dein#add('justinmk/vim-dirvish')
  call dein#add('justinmk/vim-sneak')
  call dein#add('kana/vim-textobj-user')
  call dein#add('majutsushi/tagbar')
  call dein#add('mhinz/vim-signify')
  call dein#add('michaeljsmith/vim-indent-object')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('shime/vim-livedown')
  call dein#add('simnalamburt/vim-mundo')
  call dein#add('tell-k/vim-autopep8')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('w0rp/ale')
  call dein#add('wellle/targets.vim')
  call dein#add('zchee/deoplete-jedi')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()

  " auto-install missing packages on startup
  if dein#check_install()
    call dein#install()
  endif
endif

filetype plugin indent on
syntax enable

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
