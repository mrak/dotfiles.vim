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

function! mrak#TrimTrailingWhitespace()
    let _s=winsaveview()
    keepjumps lockmarks %s/\s\+$//e
    call winrestview(_s)
endfunction

function! mrak#add_xmonad_path()
  let l:xmonad_path = expand('~/.xmonad/lib')
  if !exists('b:ghcmod_ghc_options')
    let b:ghcmod_ghc_options = []
  endif

  call add(b:ghcmod_ghc_options, '-i' . l:xmonad_path)

  let b:syntastic_haskell_ghc_mod_exe = "ghc-mod -g -i" . l:xmonad_path . " check"
endfunction
