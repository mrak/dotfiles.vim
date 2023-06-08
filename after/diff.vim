if &diff
    nnoremap dl <ESC>:diffget 2<CR>:diffupdate<CR>
    nnoremap dr <ESC>:diffget 4<CR>:diffupdate<CR>
    nnoremap du <ESC>:diffupdate<CR>
    set foldcolumn=0
endif
