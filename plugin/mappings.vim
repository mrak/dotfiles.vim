" Also use space as leader
map <space> <leader>
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
"formatting code
nnoremap <leader>= <cmd>call mrak#equalprgfile#fn()<CR>
nnoremap <leader>e <cmd>Lexplore<CR>
" escape the terminal pane
tnoremap <silent> <C-g> <C-\><C-n>
if has('nvim')
  " terminal window commands
  tnoremap <silent> <c-w>h <C-\><C-n><c-w>h
  tnoremap <silent> <c-w>j <C-\><C-n><c-w>j
  tnoremap <silent> <c-w>k <C-\><C-n><c-w>k
  tnoremap <silent> <c-w>l <C-\><C-n><c-w>l
  tnoremap <silent> <c-w><c-w> <C-\><C-n><c-w><c-w>
  tnoremap <silent> <c-w>s <C-\><C-n><c-w>s
  tnoremap <silent> <c-w>v <C-\><C-n><c-w>v
  tnoremap <silent> <c-w>c <cmd>bw!<CR>
endif
" Diagnostics
nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>dl <cmd>lua vim.diagnostic.setloclist()<CR>
" Git
nnoremap git <cmd> call mrak#git#openfugitive()<CR>
" FZF
nnoremap <leader>ff <cmd>Files<CR>
nnoremap <leader>fg <cmd>GFiles<CR>
nnoremap <leader>fb <cmd>Buffers<CR>
nnoremap <leader>fl <cmd>Lines<CR>
nnoremap <leader>ft <cmd>Tags<CR>
nnoremap <leader>fm <cmd>History<CR>
nnoremap <leader>fr <cmd>Rg<CR>
