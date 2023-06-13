for [type, text] in items(#{Error: '■', Warn: '▲', Info: '●', Hint: '♦'})
    let s:hl = "DiagnosticSign".type
    exe 'sign define '.s:hl.' text='.text.' texthl='.s:hl.' numhl='.s:hl
endfor
