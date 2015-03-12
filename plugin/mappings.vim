" override defaults
nnoremap Y y$
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> L <ESC>$
nnoremap <silent> H <ESC>^
" Pasting over content does not replace register contents
xnoremap <expr> p 'pgv"'.v:register.'y'
"nnoremap <space> :
"
nnoremap <silent> <F2> <ESC>:call mrak#QuickfixToggle()<CR>
inoremap <silent> <F2> <ESC>:call mrak#QuickfixToggle()<CR>
nnoremap <silent> <F3> <ESC>:call mrak#LocationToggle()<CR>
inoremap <silent> <F3> <ESC>:call mrak#LocationToggle()<CR>
noremap <silent> <F5> <ESC>:checktime<CR>
"moving lines
nnoremap <C-DOWN> :m .+1<CR>==
nnoremap <C-UP> :m .-2<CR>==
inoremap <C-DOWN> <ESC>:m .+1<CR>==gi
inoremap <C-UP> <ESC>:m .-2<CR>==gi
vnoremap <C-DOWN> :m '>+1<CR>gv=gv
vnoremap <C-UP> :m '<-2<CR>gv=gv
"command window mode opens and closes with ::
nnoremap :: <ESC>q:
autocmd CmdwinEnter [:>] nnoremap <silent> :: <ESC>:q<CR>
autocmd CmdwinLeave [:>] nnoremap <silent> :: <ESC>q:

"let mapleader = ","
nnoremap <silent> <leader>\ <ESC>:set hlsearch!<CR>
"formatting code
nnoremap <silent> <leader>= <ESC>mmgg=G'm

com! Sudo %!sudo tee > /dev/null %
com! Cd cd %:p:h

nnoremap <silent> <leader>e <ESC>:Vexplore $PWD<CR>
nnoremap <leader>si :call mrak#SynStack()<CR>
