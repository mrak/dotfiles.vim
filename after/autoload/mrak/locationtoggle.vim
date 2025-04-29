" Open location list. If already open, close it.
function! mrak#locationtoggle#fn()
    for winnr in range(1, winnr('$'))
        let l:winfo = win_getid(winnr)->getwininfo()[0]
        if l:winfo.loclist == 1
            lclose
            return
        endif
    endfor
    try | lwindow | catch | endtry
endfunction
