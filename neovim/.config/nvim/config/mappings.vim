" Fuzzy search file list
nn <C-p> :Files<CR>
" Fuzzy search file contents
nn <M-p> :Ag<CR>
" We basically have an IDE now
nn <Leader>b :TagbarToggle<CR>
" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Until ex mode dies in a fire: https://github.com/neovim/neovim/issues/1089
nn Q :qa<CR>
