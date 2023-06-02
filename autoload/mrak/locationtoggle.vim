function! mrak#locationtoggle#fn()
    for winnr in range(1, winnr('$'))
        let l:winfo = getwininfo(win_getid(winnr))[0]
        if l:winfo.loclist == 1
            lclose
            return
        endif
    endfor
    try | lwindow | catch || endtry
endfunction
