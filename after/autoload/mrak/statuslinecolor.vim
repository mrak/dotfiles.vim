function! mrak#statuslinecolor#mode(mode)
    if     a:mode =~# "^n" | hi! link StatusLine StatusLineNor
    elseif a:mode =~# "^i" | hi! link StatusLine StatusLineIns
    elseif a:mode =~# "^Rv"| hi! link StatusLine StatusLineVRep
    elseif a:mode =~# "^R" | hi! link StatusLine StatusLineRep
    elseif a:mode =~? "^v" | hi! link StatusLine StatusLineVis
    elseif a:mode =~# "^"| hi! link StatusLine StatusLineVis
    elseif a:mode =~? "^s" | hi! link StatusLine StatusLineVis
    elseif a:mode =~# "" | hi! link StatusLine StatusLineVis
    elseif a:mode =~# "^c" | hi! link StatusLine StatusLineCmd
    elseif a:mode ==# "t"  | hi! link StatusLine StatusLineTerm
    else                   | hi! link StatusLine StatusLineNor
    endif
    redrawstatus
endfunction
