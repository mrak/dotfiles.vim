" override defaults
nnoremap Y y$
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Pasting over content does not replace register contents
xnoremap <expr> p 'pgv"'.v:register.'y'
" F keys
nnoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
inoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
nnoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
inoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
noremap  <F5> <cmd>checktime<CR>
"moving lines
nnoremap <C-DOWN> :m .+1<CR>==
nnoremap <C-UP> :m .-2<CR>==
inoremap <C-DOWN> <ESC>:m .+1<CR>==gi
inoremap <C-UP> <ESC>:m .-2<CR>==gi
vnoremap <C-DOWN> :m '>+1<CR>gv=gv
vnoremap <C-UP> :m '<-2<CR>gv=gv
"formatting code
nnoremap <silent> <leader>= <ESC>mmgg=G'm
nnoremap <leader>e <cmd>Lexplore<CR>
" escape the terminal pane
tnoremap <silent> <C-g> <C-\><C-n>
" Diagnostics
nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>dl <cmd>lua vim.diagnostic.setloclist()<CR>
