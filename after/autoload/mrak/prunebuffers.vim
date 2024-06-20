" Wipe all buffers not currently in a window in any tab.
function! mrak#prunebuffers#fn()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    let nPruned = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nPruned = nPruned + 1
        endif
    endfor
    echomsg nPruned . ' buffer(s) pruned'
endfunction
