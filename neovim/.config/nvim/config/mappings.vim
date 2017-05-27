nn <C-p> :FZF<CR>
" We basically have an IDE now
nn <Leader>b :TagbarToggle<CR>
" Silver searcher
nn <M-f> :Ag<CR>
" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Until ex mode dies in a fire: https://github.com/neovim/neovim/issues/1089
nn Q :qa<CR>
