autocmd FilterWritePre * if &diff | set foldcolumn=0 | endif
if &diff
    let &columns = ((&columns*2 > 172)? 172: &columns*2)
    set lines=100 columns=210
    autocmd VimResized * wincmd =
    nnoremap dl <ESC>:diffget 2<CR>:diffupdate<CR>
    nnoremap dr <ESC>:diffget 4<CR>:diffupdate<CR>
    nnoremap du <ESC>:diffupdate<CR>
endif
