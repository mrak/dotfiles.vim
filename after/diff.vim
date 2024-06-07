if &diff
  nunmap <leader>dl
  nunmap <leader>dr
  nunmap <leader>du
  nnoremap <leader>dl <ESC>:diffget 2<CR>:diffupdate<CR>
  nnoremap <leader>dr <ESC>:diffget 4<CR>:diffupdate<CR>
  nnoremap <leader>du <ESC>:diffupdate<CR>
  set foldcolumn=0
endif
