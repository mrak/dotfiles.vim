function! mrak#diff#setup()
  if exists('b:mrakdiffsetup')
    return
  let b:mrakdiffsetup = 1
  nnoremap <buffer> <leader>dl <cmd>diffget LOCAL<CR>
  nnoremap <buffer> <leader>dr <cmd>diffget REMOTE<CR>
  nnoremap <buffer> <leader>db <cmd>diffget BASE<CR>
  nnoremap <buffer> <leader>du <cmd>diffupdate<CR>
  setlocal foldmethod=diff
  setlocal foldcolumn=0
endfunction
