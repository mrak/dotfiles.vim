augroup Mrak#diff
    autocmd!
    autocmd FilterWritePre * if &diff | set foldcolumn=0 | endif
    if &diff
        autocmd VimResized * wincmd =
        nnoremap dl <ESC>:diffget 2<CR>:diffupdate<CR>
        nnoremap dr <ESC>:diffget 4<CR>:diffupdate<CR>
        nnoremap du <ESC>:diffupdate<CR>
    endif
augroup END
