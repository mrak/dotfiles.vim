" Wipe all buffers not currently in a window in any tab.
function! mrak#prunebuffers#fn(bang)
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  let action = a:bang ? 'bwipeout' : 'bdelete'
  for i in range(tabpagenr('$'))
    eval tablist->extend(tabpagebuflist(i + 1))
  endfor

  let nPruned = 0
  for i in range(1, bufnr('$'))
    if (a:bang && bufexists(i)) || (!a:bang && buflisted(i))
      if !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
        silent exec action i
        let nPruned = nPruned + 1
      endif
    endif
  endfor
  echomsg nPruned . ' buffer(s) pruned via :' . action
endfunction
