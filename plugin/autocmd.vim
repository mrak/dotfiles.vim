augroup Mrak#Plugin
    autocmd!
    autocmd InsertEnter * call mrak#StatusLineColor(v:insertmode)
    autocmd InsertChange * call mrak#StatusLineColor(v:insertmode)
    autocmd InsertLeave * highlight! link StatusLine StatusLineNor
    autocmd FocusLost * silent! wa
    autocmd BufEnter * silent! checktime %
    autocmd BufWritePre * :call mrak#TrimTrailingWhitespace()
    " autocmd BufAdd * :call mrak#DeleteBufferIfEmpty()

    if has('nvim') " nvim terminal
        autocmd TermOpen * setlocal statusline=\ %{mrak#Mode()}\ %{b:term_title}
        autocmd TermOpen * set signcolumn=no
        autocmd TermOpen * set nonumber
    endif
augroup END
