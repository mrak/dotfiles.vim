" override defaults
nnoremap Y y$
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Pasting over content does not replace register contents
xnoremap <expr> p 'pgv"'.v:register.'y'
" F keys
nnoremap <silent> <F2> <cmd>call mrak#QuickfixToggle()<CR>
inoremap <silent> <F2> <cmd>call mrak#QuickfixToggle()<CR>
nnoremap <silent> <F3> <cmd>call mrak#LocationToggle()<CR>
inoremap <silent> <F3> <cmd>call mrak#LocationToggle()<CR>
noremap  <silent> <F5> <cmd>checktime<CR>
"moving lines
nnoremap <C-DOWN> :m .+1<CR>==
nnoremap <C-UP> :m .-2<CR>==
inoremap <C-DOWN> <ESC>:m .+1<CR>==gi
inoremap <C-UP> <ESC>:m .-2<CR>==gi
vnoremap <C-DOWN> :m '>+1<CR>gv=gv
vnoremap <C-UP> :m '<-2<CR>gv=gv
"command window mode opens and closes with ::
"nnoremap :: <ESC>q:
"autocmd CmdwinEnter [:>] nnoremap <silent> :: <ESC>:q<CR>
"autocmd CmdwinLeave [:>] nnoremap <silent> :: <ESC>q:
" vim-unimpaired
"nnoremap <silent> <leader>l <cmd>set list!<CR>
"nnoremap <silent> <leader>\ <cmd>set hlsearch!<CR>
"formatting code
nnoremap <silent> <leader>= <ESC>mmgg=G'm
nnoremap <silent> <leader>e <ESC>:Lexplore<CR>
" replaced with :Inspect
"nnoremap <leader>si :call mrak#SynStack()<CR>
" escape the terminal pane
tnoremap <silent> <C-g> <C-\><C-n>
" Diagnostics
nnoremap <silent> <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>dl <cmd>lua vim.diagnostic.setloclist()<CR>
