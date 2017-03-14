nn <C-p> :FZF<CR>
nn <M-]> :Tags<CR>
" EasyMotion substitute, up, down
nn s <Plug>(easymotion-s2)
nn <Leader>j <Plug>(easymotion-j)
nn <Leader>k <Plug>(easymotion-k)
" When ctags fail ...
nn <leader>jd :YcmCompleter GoTo<CR>
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
" Until ex mode dies in a fire: https://github.com/neovim/neovim/issues/1089
nn Q :qa<CR>

" =========================  Visual Mode Mappings  =========================
vn g\ :<C-u>VIntSearchGrepCursor v l<CR><CR>

" =========================  FileType Behaviours  =========================
aug show_tabs
    au FileType python,html,xhtml,css,javascript set list listchars=tab:<-
aug END

aug colour_column
    au FileType python set colorcolumn=80  " pep8
aug END

" Remember the last cursor position, but not for gitcommit files
aug cursor_memory
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
aug END

aug special_types
    au BufNewFile,BufRead *.tac,master.cfg setlocal ft=python  " buildbot
    au BufNewFile,BufRead .xprofile setlocal ft=sh
    au BufNewFile,BufRead README setlocal ft=rst
aug END

aug special_formats
    au FileType xml setl sw=2 sts=2 et
aug END
