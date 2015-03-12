autocmd InsertEnter * call mrak#StatusLineColor(v:insertmode)
autocmd InsertChange * call mrak#StatusLineColor(v:insertmode)
autocmd InsertLeave * highlight! link StatusLine StatusLineNor
autocmd FocusLost * silent! wa
autocmd BufEnter * silent! checktime %
autocmd VimEnter * set visualbell t_vb=
autocmd BufWritePre * :call mrak#TrimTrailingWhitespace()
autocmd BufAdd * :call mrak#DeleteBufferIfEmpty()
" remove [No Name] buffer when using --remote-silent
autocmd QuickFixCmdPost *grep* call mrak#QuickfixToggle()
