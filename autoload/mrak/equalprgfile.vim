" Perform '=' across entire file, preserving position.
function! mrak#equalprgfile#fn()
    let l:_s=winsaveview()
    keepjumps lockmarks normal gg=G
    call winrestview(l:_s)
endfunction
