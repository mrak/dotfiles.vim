function! mrak#trimtrailingwhitespace#fn()
    let l:_s=winsaveview()
    keepjumps lockmarks %s/\s\+$//e
    call winrestview(l:_s)
endfunction
