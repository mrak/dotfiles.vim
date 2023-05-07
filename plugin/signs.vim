let s:signs = {}
let s:signs['Error'] = '■'
let s:signs['Warn'] = '▲'
let s:signs['Info'] = '●'
let s:signs['Hint'] = '♦'
let s:types = keys(s:signs)
for type in s:types
    let s:hl = "DiagnosticSign".type
    exec 'sign define '.s:hl.' text='.s:signs[type].' texthl='.s:hl.' numhl='.s:hl
endfor
