function! mrak#mode#fn()
    let l:mode = mode(1)
    if     mode =~  "^n" | return "NOR"
    elseif mode =~  "^i" | return "_↓_"
    elseif mode =~  "^Rv"| return "-R-"
    elseif mode =~# "R"  | return "REP"
    elseif mode =~# "v"  | return "VIS"
    elseif mode =~# "V"  | return "-V-"
    elseif mode =~  "" | return "|V|"
    elseif mode =~# "^s" | return "SEL"
    elseif mode =~# "^S" | return "-S-"
    elseif mode ==# "" | return "|S|"
    elseif mode =~  "^c" | return "CMD"
    elseif mode ==# "t"  | return ">_ "
    else                 | return "   "
    endif
endfunction
