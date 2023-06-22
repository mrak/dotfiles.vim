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
call s:c.hl("MrakTestUnderline",     #{fg:"low", bg:"bottom", at:"underline",     sp:"red"})
call s:c.hl("MrakTestUndercurl",     #{fg:"low", bg:"bottom", at:"undercurl",     sp:"red"})
call s:c.hl("MrakTestUnderdouble",   #{fg:"low", bg:"bottom", at:"underdouble",   sp:"red"})
call s:c.hl("MrakTestUnderdotted",   #{fg:"low", bg:"bottom", at:"underdotted",   sp:"red"})
call s:c.hl("MrakTestUnderdashed",   #{fg:"low", bg:"bottom", at:"underdashed",   sp:"red"})
call s:c.hl("MrakTestStrikethrough", #{fg:"low", bg:"bottom", at:"strikethrough", sp:"red"})
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
call s:c.hl("Conceal",       #{fg:"blue", bg:"lowest"})
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
hi! link Float        MrakGreen
hi! link Function     MrakOrange
hi! link Identifier   MrakClear
hi! link Include      MrakRed
hi! link Keyword      MrakRed
hi! link Label        MrakRed
hi! link Number       MrakGreen
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

hi! link DirvishArg MrakOrangeBold

hi! link LeapBackdrop Comment
call s:c.hl("Sneak", #{fg:"bottom", bg:"green"})

" treesitter/lsp
if has('nvim-0.8.0')
    hi! link @comment Comment
    hi! link @lsp.mod.documentation MrakLowBold
    hi! link @error Error
    hi! link @preproc PreProc
    hi! link @define Define
    hi! link @operator Operator
    hi! link @lsp.type.operator Operator
    hi! link @punctuation.delimiter Delimiter
    hi! link @punctuation.bracket Delimiter
    hi! link @punctuation.special Delimiter
    hi! link @string String
    hi! link @string.regex SpecialChar
    hi! link @string.escape SpecialChar
    hi! link @string.special SpecialChar
    hi! link @character Character
    hi! link @character.special SpecialChar
    hi! link @boolean Boolean
    hi! link @number Number
    hi! link @float Float
    hi! link @function Function
    hi! link @function.call Function
    hi! link @function.builtin Function
    hi! link @function.macro Macro
    hi! link @method Function
    hi! link @method.call Function
    hi! link @constructor Special
    hi! link @parameter MrakBold
    hi! link @lsp.type.parameter MrakBold
    hi! link @keyword Keyword
    hi! link @lsp.type.keyword Keyword
    hi! link @conditional Conditional
    hi! link @repeat Repeat
    hi! link @debug Debug
    hi! link @label Label
    hi! link @include Include
    hi! link @exception Exception
    hi! link @type Type
    hi! link @type.builtin MrakPurple
    hi! link @lsp.type.builtinType MrakPurple
    hi! link @type.qualifier Special
    hi! link @type.definition Type
    hi! link @storageclass StorageClass
    hi! link @attribute MrakClear
    hi! link @field MrakClear
    hi! link @property MrakBrown
    hi! link @lsp.type.property MrakBrown
    hi! link @variable Identifier
    hi! link @variable.builtin Identifier
    hi! link @constant Constant
    hi! link @constant.builtin Constant
    hi! link @constant.macro Macro
    hi! link @namespace MrakHigh
    hi! link @lsp.type.namespace MrakHigh
    hi! link @symbol Special
    hi! link @text MrakClear
    hi! link @text.diff.add DiffAdd
    hi! link @text.diff.delete DiffDelete
    hi! link @lsp.type.formatSpecifier @string.special
    hi! link @lsp.type.struct MrakBlue
    hi! link @lsp.type.interface MrakBlueBold
    hi! link @lsp.type.enum MrakCyanBold
    hi! link @lsp.type.enumMember MrakCyan
    hi! link @lsp.typemod.struct.defaultLibrary MrakPurple
    hi! link @lsp.type.attributeBracket Macro
    " ini
    hi! link @type.ini MrakOrange
    hi! link @property.ini MrakRed
    hi! link @punctuation.bracket.ini MrakHigh
    " yaml
    hi! link @field.yaml MrakHighest
    " toml
    hi! link @property.toml MrakRed
    hi! link @punctuation.bracket.toml MrakHigh
    " comment
    call s:c.hl("@text.uri.comment", #{sp:"blue",at:"undercurl"})
    " terraform
    hi! link @variable.builtin.terraform MrakRed
    hi! link @type.terraform NONE
    hi! link @lsp.type.type.terraform NONE
    hi! link @lsp.type.keyword.terraform NONE
    hi! link @lsp.type.property.terraform MrakBlue
    hi! link @lsp.type.enumMember.terraform MrakOrange
    " vim
    hi! link @text.reference.vimdoc MrakRed
    hi! link @text.literal.vimdoc MrakGreen
    " rust
    "hi! link @lsp.type.namespace.rust  @namespace
    "hi! link @lsp.type.operator.rust   MrakHigh
    "hi! link @lsp.type.function.rust   MrakOrange
    "hi! link @lsp.type.method.rust     MrakOrange
    "hi! link @lsp.type.keyword.rust    MrakRed
    "hi! link @lsp.type.enumMember.rust MrakCyan
    "hi! link @lsp.type.enum.rust       MrakCyanBold
    "hi! link @lsp.type.variable.rust   MrakBlue
    "hi! link @lsp.type.parameter.rust  MrakPurple
    "hi! link @lsp.type.struct.rust     MrakBrown
    "hi! link @lsp.type.interface.rust  MrakBrownBold
endif

" Ruby highlighting
hi! link rubyAttribute              MrakBlue
hi! link rubyConstant               MrakGreen
hi! link rubyInterpolation          MrakGreen
hi! link rubyInterpolationDelimiter MrakPurple
hi! link rubyRegexp                 MrakCyan
hi! link rubySymbol                 MrakCyan
hi! link rubyStringDelimiter        MrakOrange
hi! link rubyClass                  MrakRed
hi! link rubyDefine                 MrakRed
hi! link rubyInclude                MrakRed
hi! link rubySharpBang              MrakLow
hi! link rubyControl                MrakBlue
hi! link rubyExceptional            MrakBlue
hi! link rubyFunction               MrakYellow

" PHP highlighting
hi! link phpVarSelector    MrakCyan
hi! link phpMemberSelector MrakHigher
hi! link phpComparison     MrakHigher
hi! link phpParent         MrakHigher
hi! link phpRegion         MrakHigher
hi! link phpStringSingle   MrakOrange
hi! link phpType           MrakYellow
hi! link phpDefine         MrakBlue
hi! link phpInclude        MrakRed

" HTML highlighting
hi! link htmlBold             MrakYellow
hi! link htmlItalic           MrakPurple
hi! link htmlEndTag           MrakHigher
hi! link htmlTag              MrakHigher
hi! link htmlTagName          MrakGreen
hi! link htmlArg              MrakCyan
hi! link htmlSpecialTagName   MrakBlue
hi! link htmlTitle            MrakBold
hi! link htmlH1               MrakBold
hi! link htmlItalic           MrakItalic
hi! link htmlBold             MrakBold
call s:c.hl("htmlLink", #{fg:"blue", at:"undercurl"})

" Perl
hi! link perlMethod              MrakClear
hi! link perlVarPlain            MrakGreen
hi! link perlVarPlain2           MrakGreen
hi! link perlStatementStorage    MrakRed
hi! link perlStatementInclude    MrakRed
hi! link perlStatementFileDesc   MrakCyan
hi! link perlStatementRegexp     MrakCyan
hi! link perlMatchStartEnd       MrakCyan
hi! link perlSpecialString       MrakPurple


" CSS highlighting
hi! link cssBraces        MrakHigher
hi! link cssClassName     MrakPurple
hi! link cssColor         MrakCyan

" SASS highlighting
hi! link sassidChar       MrakRed
hi! link sassClassChar    MrakOrange
hi! link sassInclude      MrakPurple
hi! link sassMixing       MrakPurple
hi! link sassMixinName    MrakBlue

" JavaScript highlighting
hi! link javaScript               MrakHigher
hi! link jsFuncCall               MrakGreen
hi! link jsOperator               MrakBlue
hi! link jsPrototype              MrakCyan
hi! link javaScriptNumber         MrakRed
hi! link jsNumber                 MrakRed
hi! link javaScriptFuncArg        MrakCyan
hi! link jsFuncArgs               MrakClear
hi! link javaScriptFunction       MrakYellow
hi! link jsFunction               MrakBlue
hi! link javaScriptFuncKeyword    MrakYellow
hi! link javaScriptFuncDef        MrakCyan
hi! link javaScriptParens         MrakBold
hi! link jsParens                 MrakBold
hi! link javaScriptBraces         MrakCyan
hi! link jsBraces                 MrakCyan
hi! link jsFuncBraces             MrakCyan
hi! link javaScriptEndColons      MrakClear
hi! link javaScriptBoolean        MrakRed
hi! link jsBooleanFalse           MrakYellow
hi! link jsBooleanTrue            MrakYellow
hi! link javaScriptException      MrakBlue
hi! link javaScriptGlobal         MrakPurple
hi! link jsGlobalObjects          MrakCyan
hi! link jsThis                   MrakCyan
hi! link jsBuiltins               MrakPurple
hi! link javaScriptIdentifier     MrakGreen
hi! link jsStorageClass           MrakBlue
hi! link jsNull                   MrakPurple
hi! link jsUndefined              MrakPurple
hi! link javaScriptRegexpString   MrakOrange

" Python
hi! link pythonInclude     MrakRed
hi! link pythonStatement   MrakGreen
hi! link pythonFunction    MrakCyan
hi! link pythonBuiltin     MrakBlue

" Markdown highlighting
hi! link markdownCode               MrakCyan
hi! link markdownCodeBlock          MrakCyan
hi! link markdownHeadingDelimiter   MrakPurpleBold
hi! link markdownBold               MrakGreenBold
call s:c.hl("markdownItalic", #{fg:"green", at:"italic"})

" Git highlighting
hi! link gitcommitOverflow         MrakRed
hi! link gitcommitSummary          MrakHighest
hi! link gitcommitFirstLine        MrakClear
hi! link gitcommitHeader           MrakBlue
hi! link gitcommitBranch           MrakCyan
hi! link gitcommitSelectedFile     MrakOrange
hi! link gitcommitSelectedType     MrakYellow

" GitGutter highlighting
call s:c.hl("GitGutterAdd",          #{fg:"green",  bg:"lowest"})
call s:c.hl("GitGutterChange",       #{fg:"blue",   bg:"lowest"})
call s:c.hl("GitGutterDelete",       #{fg:"red",    bg:"lowest"})
call s:c.hl("GitGutterChangeDelete", #{fg:"purple", bg:"lowest"})

" Signify highlighting
call s:c.hl("SignifySignAdd",    #{fg:"green", bg:"lowest"})
call s:c.hl("SignifySignChange", #{fg:"blue",  bg:"lowest"})
call s:c.hl("SignifySignDelete", #{fg:"red",   bg:"lowest"})

" Shell highlighting
hi! link shShellVariables   MrakPurple
hi! link shQuote            MrakOrange
hi! link shOption           MrakBold
hi! link shNumber           MrakOrange
hi! link shCmdSubRegion     MrakRedBold

" Fish
hi! link fishCommandSub   MrakCyan
hi! link fishConditional  MrakBlue

" Haskell
hi! link hsImport      MrakRed
hi! link hsPragma      MrakPurple
hi! link hsDelimiter   MrakCyan
hi! link hsModule      MrakBlue
hi! link hsStructure   MrakBlue
hi! link VarId         MrakClear
hi! link ConId         MrakGreen
" haskell-vim
hi! link haskellImportKeywords   MrakRed
hi! link haskellType             MrakGreen
hi! link haskellIdentifier       MrakHigh

" VimL highlighting
hi! link vimOption          MrakCyan
hi! link vimVar             MrakGreen
hi! link vimEnvVar          MrakGreen
hi! link vimFuncName        MrakRed
hi! link vimFunction        MrakRed
hi! link vimIsCommand       MrakYellow
hi! link vimUserFunc        MrakRed
hi! link vimAutoEvent       MrakGreen
hi! link vimMapMod          MrakPurple
hi! link vimMapModKey       MrakPurple
hi! link vimNotation        MrakCyan
hi! link helpNotVi          MrakRed
hi! link helpSectionDelim   MrakRed
hi! link helpSpecial        MrakPurple
hi! link helpOption         MrakCyan
hi! link helpHeader         MrakBlue
hi! link helpExample        MrakHigh
hi! link qfFileName         MrakRed
hi! link qfLineNr           MrakCyan

" NERDTree highlighting
hi! link NERDTreeDirSlash   MrakBlue
hi! link NERDTreeExecFile   MrakHigher
hi! link NERDTreeFile       MrakHigher

" CtrlP
call s:c.hl("CtrlPMatch",      #{fg:"cyan", at:"underline"})
call s:c.hl("CtrlPMode1",      #{fg:"lower", bg:"high", at:"bold"})
call s:c.hl("CtrlPMode2",      #{fg:"lower", bg:"high", at:"bold"})
hi! link CtrlPBufferNr       MrakHigh
hi! link CtrlPBufferInd      MrakGreen
hi! link CtrlPBufferHid      MrakHigh
hi! link CtrlPBufferHidMod   MrakRed
hi! link CtrlPBufferVis      MrakHigh
hi! link CtrlPBufferVisMod   MrakRed
hi! link CtrlPBufferPath     MrakHigh

" Syntastic
call s:c.hl("SyntasticWarningSign", #{fg:"yellow", bg:"bottom"})
call s:c.hl("SyntasticErrorSign",   #{fg:"red", bg:"bottom"})

" ALE
call s:c.hl("ALEInfoSign",    #{fg:"blue",   bg:"bottom"})
call s:c.hl("ALEWarningSign", #{fg:"yellow", bg:"bottom"})
call s:c.hl("ALEErrorSign",   #{fg:"red",    bg:"bottom"})

" netrw
call s:c.hl("netrwMarkFile", #{fg:"bottom", bg:"green"})
hi! link netrwTreeBar MrakLow

" Rust
"hi! link rustMacro            MrakYellow
"hi! link rustModPath          MrakHigh
"hi! link rustModPathSep       MrakHigh
"hi! link rustFuncName         MrakOrange
"hi! link rustFuncCall         MrakOrange
"hi! link rustType             MrakBrown
"hi! link rustKeyword          MrakRed
"hi! link rustConditional      MrakRed
"hi! link rustString           MrakGreen
"hi! link rustDecNumber        MrakBlue
"hi! link rustFloat            MrakBlue
"hi! link rustEnumVariant      MrakCyan
"hi! link rustBoolean          MrakCyan
"hi! link rustIdentifier       MrakHigh
"hi! link rustOperator         MrakHighest
hi! link rustSigil            MrakHigh
"hi! link rustStorage          MrakPurple
"hi! link rustCommentLineDoc   MrakHigh

" Taskwarrior
hi! link Taskwarrior_field   MrakBold

" nvim-tree
hi! link NvimTreeGitStaged  MrakYellow
hi! link NvimTreeGitRenamed MrakGreen
hi! link NvimTreeGitNew     MrakBlue
hi! link NvimTreeGitMerge   MrakPurple

" Fern
call s:c.hl("FernMarkedText", #{fg:"orange", bg:"bottom", at:"bold"})
hi! link FernMarkedLine MrakOrangeBold
hi! link FernBranchSymbol MrakHigh
hi! link FernLeafSymbol MrakLow

" Free variables/funcitons
unlet s:c
