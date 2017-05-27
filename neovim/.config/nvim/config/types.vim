aug show_tabs
    au FileType python,html,xhtml,css,javascript set list listchars=tab:<-
aug END

aug colour_column
    au FileType python set colorcolumn=80  " pep8
aug END

aug special_types
    au BufNewFile,BufRead *.tac,master.cfg setlocal ft=python  " buildbot
    au BufNewFile,BufRead *.ksy setlocal ft=yaml  " Kaitai
    au BufNewFile,BufRead .xprofile setlocal ft=sh
    au BufNewFile,BufRead README setlocal ft=rst
aug END

aug special_formats
    au FileType xml setl sw=2 sts=2 et
    au FileType yaml setl sw=2 sts=2 et
aug END

" Remember the last cursor position, but not for gitcommit files
aug cursor_memory
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
aug END
