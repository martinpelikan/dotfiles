" Buffers > Tabs, once you can see them
let g:airline#extensions#tabline#enabled = 1
" Use the pretty fonts
let g:airline_powerline_fonts = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_modified_removed = '●✘'
let g:gitgutter_sign_removed = '✘_'
let g:gitgutter_sign_removed_first_line = '✘‾'
" Only set motions I'll remember
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" Folding is terrible even for markdown files
let g:vim_markdown_folding_disabled=1
" Make all sorts case insensitive and remove duplicates
let g:sort_motion_flags = "ui"
" Do project-wide searches with ag.vim
let g:ag_working_path_mode="r"
" Enable deoplete
let g:deoplete#enable_at_startup = 1
