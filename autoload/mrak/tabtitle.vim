function! mrak#tabtitle#set(...)
    let t:tabtitle = join(a:000, ' ')
    redrawtabline
endfunction
function! mrak#tabtitle#get()
    return get(t:,'tabtitle','')
endfunction
