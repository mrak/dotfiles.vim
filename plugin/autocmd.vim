augroup Mrak#autocmd
    autocmd!
    autocmd BufNewFile *.sh 0put = '#!/bin/sh' | norm j
    autocmd InsertEnter * call mrak#statuslinecolor#fn(v:insertmode)
    autocmd InsertChange * call mrak#statuslinecolor#fn(v:insertmode)
    autocmd InsertLeave * highlight! link StatusLine StatusLineNor
    autocmd FocusLost * silent! wa
    autocmd BufEnter * silent! checktime %
    autocmd BufWritePre * :call mrak#trimtrailingwhitespace#fn()

    if has('nvim') " nvim terminal
        autocmd TermOpen * setlocal statusline=\ %{mrak#mode#fn()}\ %{b:term_title}
        autocmd TermOpen * set signcolumn=no
        autocmd TermOpen * set nonumber
    endif

    autocmd BufNewFile *.js 0put = \"'use strict';\" | norm j
    autocmd BufRead,BufNewFile ~/.xmonad/* call mrak#addxmonadpath#fn()
augroup END
