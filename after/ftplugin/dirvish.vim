nnoremap <buffer><silent> p <cmd>call dirvish#open('pedit', 1)<CR>
nnoremap <buffer> md :!mkdir -p %
nnoremap <buffer> mv :!mv '<c-r><c-f>' %
nnoremap <buffer> me :e %
nnoremap <buffer> mr :!rm '<c-r><c-f>'
nnoremap <buffer> mc :!cp '<c-r><c-f>' %
