" Set the title for the current tab
function! mrak#tabtitle#set(...)
    let t:tabtitle = join(a:000, ' ')
    redrawtabline
endfunction
" Get the title of the current tab
function! mrak#tabtitle#get()
    return get(t:,'tabtitle','')
endfunction
