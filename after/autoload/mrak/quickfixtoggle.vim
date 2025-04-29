" Open quickfix window. If already open, close it.
function! mrak#quickfixtoggle#fn()
    for winnr in range(1, winnr('$'))
        let l:winfo = win_getid(winnr)->getwininfo()[0]
        if l:winfo.quickfix == 1 && l:winfo.loclist == 0
            cclose
            return
        endif
    endfor
    cwindow
endfunction
