if &diff
  nnoremap <buffer> <leader>dl <ESC>:diffget 2<CR>:diffupdate<CR>
  nnoremap <buffer> <leader>dr <ESC>:diffget 4<CR>:diffupdate<CR>
  nnoremap <buffer> <leader>du <ESC>:diffupdate<CR>
  setlocal foldmethod=diff
  setlocal foldcolumn=0
endif
