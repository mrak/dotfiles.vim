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
    let l:mode = mode()
    if     mode ==# "n"  | return "NOR"
    elseif mode ==# "i"  | return "INS"
    elseif mode ==# "R"  | return "REP"
    elseif mode ==# "v"  | return "VIS"
    elseif mode ==# "V"  | return "-V-"
    elseif mode ==# "" | return "|V|"
    elseif mode ==# "s"  | return "SEL"
    elseif mode ==# "S"  | return "-S-"
    elseif mode ==# "" | return "|S|"
    endif
endfunction
" Single fn to toggle the quickfix buffer
let g:quickfix_is_open = 0
function! mrak#QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        cwindow
        let g:quickfix_is_open = 1
    endif
endfunction

let g:location_is_open = 0
function! mrak#LocationToggle()
    if g:location_is_open
        lclose
        let g:location_is_open = 0
        execute g:location_return_to_window . "wincmd w"
    else
        let g:location_return_to_window = winnr()
        lwindow
        let g:location_is_open = 1
    endif
endfunction

function! mrak#DeleteBufferIfEmpty()
    if bufname('%') == ''
        bwipe
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
