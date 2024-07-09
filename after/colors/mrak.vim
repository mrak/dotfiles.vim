" Scheme: Eric Mrak (http://mrak.online)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak"
let s:c = {}
let s:c.palette = #{dark: {}, light: {}}
let s:c.palette.dark.gui = #{ none: "NONE"
  \, bottom  : "#1c1c1c" , red    : "#df5f87"
  \, lowest  : "#262626" , orange : "#d78700"
  \, lower   : "#303030" , yellow : "#ffd700"
  \, low     : "#444444" , green  : "#87af5f"
  \, high    : "#a8a8a8" , cyan   : "#00afaf"
  \, higher  : "#dadada" , blue   : "#87afff"
  \, highest : "#e4e4e4" , purple : "#af87ff"
  \, top     : "#f5f5f5" , brown  : "#875f00"
\}
let s:c.palette.dark["256"] = #{ none: "NONE"
  \, bottom  : "234" , red    : "168"
  \, lowest  : "235" , orange : "172"
  \, lower   : "236" , yellow : "220"
  \, low     : "238" , green  : "107"
  \, high    : "248" , cyan   : "037"
  \, higher  : "253" , blue   : "111"
  \, highest : "254" , purple : "141"
  \, top     : "015" , brown  : "094"
\}
let s:c.palette.dark["16"] = #{ none: "NONE"
  \, bottom  : "000" , red    : "001"
  \, lowest  : "000" , orange : "001"
  \, lower   : "008" , yellow : "003"
  \, low     : "008" , green  : "002"
  \, high    : "007" , cyan   : "006"
  \, higher  : "007" , blue   : "004"
  \, highest : "015" , purple : "005"
  \, top     : "015" , brown  : "003"
\}
let s:c.palette.light.gui = #{ none: "NONE"
  \, bottom  : "#f5f5f5" , red    : "#df005f"
  \, lowest  : "#e4e4e4" , orange : "#df5f00"
  \, lower   : "#dadada" , yellow : "#dfaf00"
  \, low     : "#a8a8a8" , green  : "#5faf5f"
  \, high    : "#444444" , cyan   : "#00afaf"
  \, higher  : "#303030" , blue   : "#5f87ff"
  \, highest : "#262626" , purple : "#af5fff"
  \, top     : "#1c1c1c" , brown  : "#875f00"
\}
let s:c.palette.light["256"] = #{ none: "NONE"
  \, bottom  : "015" , red    : "161"
  \, lowest  : "254" , orange : "166"
  \, lower   : "253" , yellow : "178"
  \, low     : "248" , green  : "071"
  \, high    : "238" , cyan   : "037"
  \, higher  : "236" , blue   : "069"
  \, highest : "235" , purple : "135"
  \, top     : "234" , brown  : "094"
\}
let s:c.palette.light["16"] = #{ none: "NONE"
  \, bottom  : "015" , red    : "001"
  \, lowest  : "015" , orange : "001"
  \, lower   : "007" , yellow : "003"
  \, low     : "007" , green  : "002"
  \, high    : "008" , cyan   : "006"
  \, higher  : "008" , blue   : "004"
  \, highest : "000" , purple : "005"
  \, top     : "000" , brown  : "003"
\}

let s:c.gui   = s:c.palette[&background].gui->extend(g:->get('mrak_palette_'.&background.'_gui', {}))
let s:c.cterm = s:c.palette[&background].256->extend(g:->get('mrak_palette_'.&background.'_256', {}))
if &t_Co != 256
  let s:c.cterm = s:c.palette[&background].16->extend(g:->get('mrak_palette_'.&background.'_16', {}))
endif

function s:c.hl(group, settings)
  let l:fg = get(a:settings,"fg","none")
  let l:bg = get(a:settings,"bg","none")
  let l:at = get(a:settings,"at","none")
  let l:sp = get(a:settings,"sp","none")
  exe "hi" a:group "guifg=".s:c.gui[l:fg] "guibg=".s:c.gui[l:bg] "gui=".l:at "guisp=".s:c.gui[l:sp] "ctermfg=".s:c.cterm[l:fg] "ctermbg=".s:c.cterm[l:bg] "cterm=".l:at
endfunction

" Since 'Normal' resets the 'background', do first
call s:c.hl("Normal",   #{fg:"highest", bg:"lowest"})
call s:c.hl("NormalNC", #{fg:"highest", bg:"bottom"})
" linkables
call s:c.hl("MrakBottom", #{fg:"bottom"})
call s:c.hl("MrakLowest", #{fg:"lowest"})
call s:c.hl("MrakLower",  #{fg:"lower"})
call s:c.hl("MrakLow",    #{fg:"low"})
call s:c.hl("MrakHigh",   #{fg:"high"})
call s:c.hl("MrakHigher", #{fg:"higher"})
call s:c.hl("MrakHighest",#{fg:"highest"})
call s:c.hl("MrakTop",    #{fg:"top"})
call s:c.hl("MrakRed",    #{fg:"red"})
call s:c.hl("MrakOrange", #{fg:"orange"})
call s:c.hl("MrakYellow", #{fg:"yellow"})
call s:c.hl("MrakGreen",  #{fg:"green"})
call s:c.hl("MrakCyan",   #{fg:"cyan"})
call s:c.hl("MrakBlue",   #{fg:"blue"})
call s:c.hl("MrakPurple", #{fg:"purple"})
call s:c.hl("MrakBrown",  #{fg:"brown"})
" linkables style
call s:c.hl("MrakReverse",#{at:"reverse"})
call s:c.hl("MrakClear",  #{})
call s:c.hl("MrakBold",   #{at:"bold"})
call s:c.hl("MrakItalic", #{at:"italic"})
" linkables bold
call s:c.hl("MrakBottomBold", #{fg:"bottom",  at:"bold"})
call s:c.hl("MrakLowestBold", #{fg:"lowest",  at:"bold"})
call s:c.hl("MrakLowerBold",  #{fg:"lower",   at:"bold"})
call s:c.hl("MrakLowBold",    #{fg:"low",     at:"bold"})
call s:c.hl("MrakHighBold",   #{fg:"high",    at:"bold"})
call s:c.hl("MrakHigherBold", #{fg:"higher",  at:"bold"})
call s:c.hl("MrakHighestBold",#{fg:"highest", at:"bold"})
call s:c.hl("MrakTopBold",    #{fg:"top",     at:"bold"})
call s:c.hl("MrakRedBold",    #{fg:"red",     at:"bold"})
call s:c.hl("MrakOrangeBold", #{fg:"orange",  at:"bold"})
call s:c.hl("MrakYellowBold", #{fg:"yellow",  at:"bold"})
call s:c.hl("MrakGreenBold",  #{fg:"green",   at:"bold"})
call s:c.hl("MrakCyanBold",   #{fg:"cyan",    at:"bold"})
call s:c.hl("MrakBlueBold",   #{fg:"blue",    at:"bold"})
call s:c.hl("MrakPurpleBold", #{fg:"purple",  at:"bold"})
call s:c.hl("MrakBrownBold",  #{fg:"brown",   at:"bold"})
" linkables test
call s:c.hl("MrakTestUnderline",     #{fg:"low", bg:"bottom", at:"underline",               sp:"red"})
call s:c.hl("MrakTestUndercurl",     #{fg:"low", bg:"bottom", at:"undercurl",               sp:"red"})
call s:c.hl("MrakTestUnderdouble",   #{fg:"low", bg:"bottom", at:"underdouble",             sp:"red"})
call s:c.hl("MrakTestUnderdotted",   #{fg:"low", bg:"bottom", at:"underdotted",             sp:"red"})
call s:c.hl("MrakTestUnderdashed",   #{fg:"low", bg:"bottom", at:"underdashed",             sp:"red"})
call s:c.hl("MrakTestStrikethrough", #{fg:"low", bg:"bottom", at:"strikethrough",           sp:"red"})
call s:c.hl("MrakTestStrikecurl",    #{fg:"low", bg:"bottom", at:"strikethrough,undercurl", sp:"red"})
" Vim editor colors
call s:c.hl("Cursor",        #{fg:"bottom", bg:"top"})
call s:c.hl("CursorColumn",  #{             bg:"bottom"})
call s:c.hl("CursorLine",    #{             bg:"bottom"})
call s:c.hl("LineNr",        #{fg:"low",    bg:"bottom"})
call s:c.hl("CursorLineNr",  #{fg:"low",    bg:"bottom"})
call s:c.hl("VertSplit",     #{fg:"bottom", bg:"bottom"})
hi! link NonText MrakLow
call s:c.hl("EndOfBuffer",   #{fg:"bottom", bg:"bottom"})
call s:c.hl("StatusLine",    #{fg:"lowest", bg:"high",   at:"bold"})
call s:c.hl("StatusLineNor", #{fg:"lowest", bg:"high",   at:"bold"})
call s:c.hl("StatusLineIns", #{fg:"lowest", bg:"green",  at:"bold"})
call s:c.hl("StatusLineRep", #{fg:"lowest", bg:"purple", at:"bold"})
call s:c.hl("StatusLineVRep",#{fg:"lowest", bg:"purple", at:"bold"})
call s:c.hl("StatusLineVis", #{fg:"lowest", bg:"blue",   at:"bold"})
call s:c.hl("StatusLineCmd", #{fg:"lowest", bg:"orange", at:"bold"})
call s:c.hl("StatusLineTerm",#{fg:"lowest", bg:"red",    at:"bold"})
call s:c.hl("StatusLineNC",  #{fg:"low",    bg:"bottom", at:"bold"})
hi! link FoldColumn LineNr
call s:c.hl("Folded",        #{fg:"low", bg:"bottom"})
call s:c.hl("IncSearch",     #{fg:"lowest", bg:"orange"})
hi! link Bold     MrakBold
hi! link Italic   MrakItalic
hi! link ModeMsg  MrakGreen
hi! link MoreMsg  MrakGreen
hi! link Question MrakYellow
hi! link Search   MrakReverse
call s:c.hl("MatchParen",    #{fg:"lowest", bg:"high"})
hi! link Underlined      MrakRed
call s:c.hl("Visual",        #{fg:"top", bg:"low"})
call s:c.hl("VisualNOS",     #{fg:"red", at:"reverse"})
hi! link WarningMsg      MrakRed
hi! link WildMenu        MrakRed
hi! link Title           MrakBlue
hi! link Conceal  MrakLow
hi! link SignColumn LineNr
hi! link SpecialKey MrakLow
call s:c.hl("ColorColumn",  #{fg:"low",    bg:"lowest"})
call s:c.hl("PMenu",        #{fg:"high",   bg:"bottom"})
call s:c.hl("PMenuSel",     #{fg:"lowest", bg:"green"})
call s:c.hl("TabLine",      #{fg:"low",    bg:"bottom"})
call s:c.hl("TabLineFill",  #{fg:"low",    bg:"bottom"})
call s:c.hl("TabLineSel",   #{fg:"green",  bg:"bottom"})
call s:c.hl("TabLineProg",  #{fg:"low",    bg:"bottom"})
call s:c.hl("TabLineNum",   #{fg:"bottom", bg:"low"})
call s:c.hl("TabLineNumSel",#{fg:"bottom", bg:"green"})
call s:c.hl("WinSeparator" ,#{fg:"lower",  bg:"bottom", at:"strikethrough"})


hi! link Debug     MrakRed
hi! link Directory MrakBlue
hi! link Error     MrakRedBold
hi! link ErrorMsg  MrakRedBold
hi! link Exception MrakRed
hi! link Macro     MrakYellow
hi! link TooLong   MrakRed

" Standard syntax highlighting
hi! link Boolean      MrakCyan
hi! link Character    MrakGreenBold
hi! link Comment      MrakLow
hi! link Conditional  MrakRed
hi! link Constant     MrakCyan
hi! link Define       MrakYellow
hi! link PreCondit    MrakYellow
hi! link Delimiter    MrakClear
hi! link Float        MrakCyan
hi! link Function     MrakOrange
hi! link Identifier   MrakClear
hi! link Include      MrakRed
hi! link Keyword      MrakRed
hi! link Label        MrakRed
hi! link Number       MrakCyan
hi! link Operator     MrakHigh
hi! link PreProc      MrakYellow
hi! link Repeat       MrakRed
hi! link Special      MrakCyan
hi! link SpecialChar  MrakCyan
hi! link Statement    MrakRed
hi! link StorageClass MrakPurple
hi! link String       MrakGreen
hi! link Structure    MrakPurple
hi! link Tag          MrakCyan
hi! link Todo         MrakYellow
hi! link Type         MrakBlue
hi! link Typedef      MrakPurple

" Spelling highlighting
call s:c.hl("SpellBad",   #{at:"undercurl", sp:"red"})
call s:c.hl("SpellLocal", #{at:"undercurl", sp:"orange"})
call s:c.hl("SpellCap",   #{at:"undercurl", sp:"blue"})
call s:c.hl("SpellRare",  #{at:"undercurl", sp:"green"})
" Diagnostics
hi! link DiagnosticError MrakRed
hi! link DiagnosticWarn  MrakYellow
hi! link DiagnosticInfo  MrakBlue
hi! link DiagnosticHint  MrakHigher
call s:c.hl("DiagnosticSignError"           , #{fg:"red",    bg:"bottom"})
call s:c.hl("DiagnosticSignWarn"            , #{fg:"yellow", bg:"bottom"})
call s:c.hl("DiagnosticSignInfo"            , #{fg:"blue",   bg:"bottom"})
call s:c.hl("DiagnosticSignHint"            , #{fg:"higher", bg:"bottom"})
call s:c.hl("DiagnosticFloatingError"       , #{fg:"red",    bg:"bottom"})
call s:c.hl("DiagnosticFloatingWarn"        , #{fg:"yellow", bg:"bottom"})
call s:c.hl("DiagnosticFloatingInfo"        , #{fg:"blue",   bg:"bottom"})
call s:c.hl("DiagnosticFloatingHint"        , #{fg:"higher", bg:"bottom"})
call s:c.hl("DiagnosticFloatingOk"          , #{bg:"bottom"})
call s:c.hl("DiagnosticUnderlineError"      , #{at:'undercurl'})
call s:c.hl("DiagnosticUnderlineWarning"    , #{at:'undercurl'})
call s:c.hl("DiagnosticUnderlineWarn"       , #{at:'undercurl'})
call s:c.hl("DiagnosticUnderlineInformation", #{at:'undercurl'})
call s:c.hl("DiagnosticUnderlineHint"       , #{at:'undercurl'})
hi! link LspDiagnosticsDefaultError         DiagnosticError
hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
hi! link LspDiagnosticsDefaultHint          DiagnosticHint
hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarning
hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInformation
hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
call s:c.hl('LspInfoBorder', #{fg:'green', bg:'bottom'})

" Diff mode
call s:c.hl("DiffAdd",    #{fg:"lowest", bg:"green",  at:"bold"})
call s:c.hl("DiffChange", #{fg:"lowest", bg:"purple"})
call s:c.hl("DiffDelete", #{fg:"lowest", bg:"red",    at:"bold"})
call s:c.hl("DiffText",   #{fg:"lowest", bg:"purple", at:"bold,underline"})
" Additional diff highlighting
hi! link DiffAdded     MrakGreenBold
hi! link DiffFile      MrakLow
hi! link diffOldFile   MrakBrown
hi! link DiffNewFile   MrakOrange
hi! link DiffLine      MrakCyan
hi! link DiffRemoved   MrakRedBold
hi! link DiffSubname   MrakHigh
hi! link diffIndexLine MrakPurple

hi! link DirvishArg  MrakOrangeBold
hi! link DirvishExe  String
call s:c.hl('DirvishLink', #{fg:'high',at:'undercurl'})

hi! link LeapBackdrop Comment
call s:c.hl("Sneak", #{fg:"bottom", bg:"green"})

" treesitter/lsp corrections
if has('nvim-0.8.0')
  hi! link @punctuation Operator
  hi! link @punctuation.special Operator
  hi! link @property MrakBrown
  hi! link @variable.builtin Keyword
  hi! link @variable.member MrakBlue
  hi! link @lsp.type.type.terraform NONE
  hi! link @lsp.type.variable.terraform NONE
  hi! link @lsp.type.property.terraform NONE
  hi! link @lsp.type.property.terraform-vars NONE
  hi! link @lsp.type.parameter.terraform-vars NONE
endif

" netrw
call s:c.hl("netrwMarkFile", #{fg:"bottom", bg:"green"})
hi! link netrwTreeBar MrakLow

" Rust
hi! link rustSigil            MrakHigh

" vim-visual-multi
call s:c.hl("VM_Cursor",   #{fg:"top", bg:"bottom", at:"bold,underline"})
call s:c.hl("VM_Mono",   #{fg:"top", bg:"bottom", at:"bold,underline"})
hi! link VM_Extend Visual
hi! link VM_Insert StatusLineIns

" Free variables/funcitons
unlet s:c
