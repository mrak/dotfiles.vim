function! mrak#Zoom(amount)
    let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
    let s:min = 6
    let s:max = 20
    let font = substitute(&guifont, s:pattern, '\1', '')
    let prev = substitute(&guifont, s:pattern, '\2', '')
    let next = prev + a:amount
    if (next >= s:min) && (next <= s:max)
        let result = font . next
        let &guifont = result
    endif
endfunction

function! mrak#StatusLineColor(mode)
    if a:mode == 'i'
        highlight! link StatusLine StatusLineIns
    elseif a:mode == 'r'
        highlight! link StatusLine StatusLineRep
    else
        highlight! link StatusLine StatusLineVRep
    endif
endfunction

function! mrak#Mode()
    let l:mode = mode(1)
    if     mode =~  "^n" | return "NOR"
    elseif mode =~  "^i" | return "_↓_"
    elseif mode =~  "^Rv"| return "-R-"
    elseif mode =~  "R"  | return "REP"
    elseif mode =~  "v"  | return "VIS"
    elseif mode =~  "V"  | return "-V-"
    elseif mode =~  "" | return "|V|"
    elseif mode =~  "^s" | return "SEL"
    elseif mode =~  "^S" | return "-S-"
    elseif mode ==# "" | return "|S|"
    elseif mode =~  "^c" | return "CMD"
    elseif mode ==# "t"  | return ">_ "
    else                 | return "   "
    endif
endfunction
" Single fn to toggle the quickfix buffer
function! mrak#QuickfixToggle()
    for winnr in range(1, winnr('$'))
        let l:winfo = getwininfo(win_getid(winnr))[0]
        if l:winfo.quickfix == 1 && l:winfo.loclist == 0
            cclose
            return
        endif
    endfor
    cwindow
endfunction

function! mrak#LocationToggle()
    for winnr in range(1, winnr('$'))
        let l:winfo = getwininfo(win_getid(winnr))[0]
        if l:winfo.loclist == 1
            lclose
            return
        endif
    endfor
    try | lwindow | catch || endtry
endfunction

function! mrak#DeleteBufferIfEmpty()
    if bufexists('')
        bwipeout ''
        " This will trigger filetype detection, mainly for syntax highlighting
        doautocmd BufRead
    endif
endfunction

function! mrak#TrimTrailingWhitespace()
    let _s=winsaveview()
    keepjumps lockmarks %s/\s\+$//e
    call winrestview(_s)
endfunction

function! mrak#SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
