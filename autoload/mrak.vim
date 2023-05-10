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
    if     mode ==# "n"  | return "NOR"
    elseif mode ==# "i"  | return "_↓_"
    elseif mode ==# "R"  | return "REP"
    elseif mode ==# "Rv" | return "-R-"
    elseif mode ==# "v"  | return "VIS"
    elseif mode ==# "V"  | return "-V-"
    elseif mode ==# "" | return "|V|"
    elseif mode ==# "s"  | return "SEL"
    elseif mode ==# "S"  | return "-S-"
    elseif mode ==# "" | return "|S|"
    elseif mode ==# "c"  | return "CMD"
    elseif mode ==# "cv" | return "CMD"
    elseif mode ==# "ce" | return "CMD"
    elseif mode ==# "t"  | return ">_ "
    else                 | return "   "
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
