" Scheme: Eric Mrak (http://ericmrak.info)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak"
let s:gui = {}
let s:cterm = {}

if &background == "dark"
    " dark greyscale
    let s:gui.bottom  = "1c1c1c"
    let s:gui.lowest  = "262626"
    let s:gui.lower   = "303030"
    let s:gui.low     = "444444"
    let s:gui.high    = "a8a8a8"
    let s:gui.higher  = "dadada"
    let s:gui.highest = "e4e4e4"
    let s:gui.top     = "f5f5f5"
    if &t_Co == 256
        let s:cterm.bottom  = "234"
        let s:cterm.lowest  = "235"
        let s:cterm.lower   = "236"
        let s:cterm.low     = "238"
        let s:cterm.high    = "248"
        let s:cterm.higher  = "253"
        let s:cterm.highest = "254"
        let s:cterm.top     = "015"
    else
        let s:cterm.bottom  = "000"
        let s:cterm.lowest  = "000"
        let s:cterm.lower   = "008"
        let s:cterm.low     = "008"
        let s:cterm.high    = "007"
        let s:cterm.higher  = "007"
        let s:cterm.highest = "015"
        let s:cterm.top     = "015"
    endif
    " dark colors
    let s:gui.red      = "df5f87"
    let s:gui.orange   = "d78700"
    let s:gui.yellow   = "ffd700"
    let s:gui.green    = "87af5f"
    let s:gui.cyan     = "00afaf"
    let s:gui.blue     = "87afff"
    let s:gui.purple   = "af87ff"
    let s:gui.brown    = "875f00"
    if &t_Co == 256
        let s:cterm.red    = "168"
        let s:cterm.orange = "172"
        let s:cterm.yellow = "220"
        let s:cterm.green  = "107"
        let s:cterm.cyan   = "037"
        let s:cterm.blue   = "111"
        let s:cterm.purple = "141"
        let s:cterm.brown  = "094"
    else
        let s:cterm.red    = "001"
        let s:cterm.orange = "001"
        let s:cterm.yellow = "003"
        let s:cterm.green  = "002"
        let s:cterm.cyan   = "006"
        let s:cterm.blue   = "004"
        let s:cterm.purple = "005"
        let s:cterm.brown  = "003"
    endif
else
    " light greyscale
    let s:gui.bottom  = "f5f5f5"
    let s:gui.lowest  = "e4e4e4"
    let s:gui.lower   = "dadada"
    let s:gui.low     = "a8a8a8"
    let s:gui.high    = "444444"
    let s:gui.higher  = "303030"
    let s:gui.highest = "262626"
    let s:gui.top     = "1c1c1c"
    if &t_Co == 256
        let s:cterm.bottom  = "015"
        let s:cterm.lowest  = "254"
        let s:cterm.lower   = "253"
        let s:cterm.low     = "248"
        let s:cterm.high    = "238"
        let s:cterm.higher  = "236"
        let s:cterm.highest = "235"
        let s:cterm.top     = "234"
    else
        let s:cterm.bottom  = "015"
        let s:cterm.lowest  = "015"
        let s:cterm.lower   = "007"
        let s:cterm.low     = "007"
        let s:cterm.high    = "008"
        let s:cterm.higher  = "008"
        let s:cterm.highest = "000"
        let s:cterm.top     = "000"
    endif
    " light colors
    let s:gui.red      = "df005f"
    let s:gui.orange   = "df5f00"
    let s:gui.yellow   = "dfaf00"
    let s:gui.green    = "5faf5f"
    let s:gui.cyan     = "00afaf"
    let s:gui.blue     = "5f87ff"
    let s:gui.purple   = "af5fff"
    let s:gui.brown    = "875f00"
    if &t_Co == 256
        let s:cterm.red    = "161"
        let s:cterm.orange = "166"
        let s:cterm.yellow = "178"
        let s:cterm.green  = "071"
        let s:cterm.cyan   = "037"
        let s:cterm.blue   = "069"
        let s:cterm.purple = "135"
        let s:cterm.brown  = "094"
    else
        let s:cterm.red    = "001"
        let s:cterm.orange = "001"
        let s:cterm.yellow = "003"
        let s:cterm.green  = "002"
        let s:cterm.cyan   = "006"
        let s:cterm.blue   = "004"
        let s:cterm.purple = "005"
        let s:cterm.brown  = "003"
    endif
endif


" Highhighing function
fun <sid>hi(group, fg, bg, attr)
  let l:string = "hi " . a:group
  if a:fg == ""
    let l:string .= " guifg=NONE ctermfg=NONE"
  else
    let l:string .= " guifg=#" . s:gui[a:fg] . " ctermfg=" . s:cterm[a:fg]
  endif

  if a:bg == ""
    let l:string .= " guibg=NONE ctermbg=NONE"
  else
    let l:string .= " guibg=#" . s:gui[a:bg] . " ctermbg=" . s:cterm[a:bg]
  endif

  if a:attr == ""
    let l:string .= " gui=NONE cterm=NONE"
  else
    let l:string .= " gui=" . a:attr . " cterm=" . a:attr
  endif

  exec l:string
endfun

" linkables
call <sid>hi("MrakBottom", "bottom", "", "")
call <sid>hi("MrakLowest", "lowest", "", "")
call <sid>hi("MrakLower",  "lower", "", "")
call <sid>hi("MrakLow",    "low", "", "")
call <sid>hi("MrakHigh",   "high", "", "")
call <sid>hi("MrakHigher", "higher", "", "")
call <sid>hi("MrakHighest","highest", "", "")
call <sid>hi("MrakTop",    "top", "", "")
call <sid>hi("MrakRed",    "red", "", "")
call <sid>hi("MrakOrange", "orange", "", "")
call <sid>hi("MrakYellow", "yellow", "", "")
call <sid>hi("MrakGreen",  "green", "", "")
call <sid>hi("MrakCyan",   "cyan", "", "")
call <sid>hi("MrakBlue",   "blue", "", "")
call <sid>hi("MrakPurple", "purple", "", "")
call <sid>hi("MrakBrown",  "brown", "", "")

call <sid>hi("MrakReverse",  "", "", "reverse")
call <sid>hi("MrakClear",  "", "", "")
call <sid>hi("MrakBold",  "", "", "bold")
call <sid>hi("MrakItalic",  "", "", "italic")

call <sid>hi("MrakBottomBold", "bottom", "", "bold")
call <sid>hi("MrakLowestBold", "lowest", "", "bold")
call <sid>hi("MrakLowerBold",  "lower", "", "bold")
call <sid>hi("MrakLowBold",    "low", "", "bold")
call <sid>hi("MrakHighBold",   "high", "", "bold")
call <sid>hi("MrakHigherBold", "higher", "", "bold")
call <sid>hi("MrakHighestBold","highest", "", "bold")
call <sid>hi("MrakTopBold",    "top", "", "bold")
call <sid>hi("MrakRedBold",    "red", "", "bold")
call <sid>hi("MrakOrangeBold", "orange", "", "bold")
call <sid>hi("MrakYellowBold", "yellow", "", "bold")
call <sid>hi("MrakGreenBold",  "green", "", "bold")
call <sid>hi("MrakCyanBold",   "cyan", "", "bold")
call <sid>hi("MrakBlueBold",   "blue", "", "bold")
call <sid>hi("MrakPurpleBold", "purple", "", "bold")
call <sid>hi("MrakBrownBold",  "brown", "", "bold")

" Vim editor colors
call <sid>hi("Cursor",        "bottom", "top", "")
call <sid>hi("CursorColumn",  "low", "bottom", "none")
call <sid>hi("CursorLine",    "", "lower", "")
call <sid>hi("LineNr",        "low", "bottom", "")
call <sid>hi("CursorLineNr",  "low", "bottom", "")
call <sid>hi("VertSplit",     "bottom", "bottom", "none")
call <sid>hi("NonText",       "low", "", "")
if has('nvim')
  call <sid>hi("EndOfBuffer",   "bottom", "bottom", "")
endif
call <sid>hi("StatusLine",    "lowest", "high", "bold")
call <sid>hi("StatusLineNor", "lowest", "high", "bold")
call <sid>hi("StatusLineIns", "lowest", "green", "bold")
call <sid>hi("StatusLineRep", "lowest", "purple", "bold")
call <sid>hi("StatusLineVRep","lowest", "purple", "bold")
call <sid>hi("StatusLineNC",  "low", "bottom", "")
call <sid>hi("FoldColumn",    "", "lowest", "")
call <sid>hi("Folded",        "low", "bottom", "")
call <sid>hi("IncSearch",     "lowest", "orange", "none")
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Italic",        "", "", "italic")
call <sid>hi("ModeMsg",       "green", "", "")
call <sid>hi("MoreMsg",       "green", "", "")
call <sid>hi("Question",      "yellow", "", "")
call <sid>hi("Search",        "", "",  "reverse")
call <sid>hi("MatchParen",    "lowest", "high",  "")
call <sid>hi("Underlined",    "red", "", "")
call <sid>hi("Visual",        "top", "low", "")
call <sid>hi("VisualNOS",     "red", "", "reverse")
call <sid>hi("WarningMsg",    "red", "", "")
call <sid>hi("WildMenu",      "red", "", "")
call <sid>hi("Title",         "blue", "", "none")
call <sid>hi("Conceal",       "blue", "lowest", "")
hi! link SignColumn LineNr
call <sid>hi("SpecialKey",    "low", "", "")
call <sid>hi("ColorColumn",   "low", "lowest", "none")
call <sid>hi("PMenu",         "high", "bottom", "none")
call <sid>hi("PMenuSel",      "lowest", "green", "")
call <sid>hi("TabLine",       "low", "lowest", "none")
call <sid>hi("TabLineFill",   "low", "lowest", "none")
call <sid>hi("TabLineSel",    "green", "lowest", "none")

hi! link Debug MrakRed
hi! link Directory MrakBlue
hi! link Error MrakRedBold
hi! link ErrorMsg MrakRedBold
hi! link Exception MrakRed
hi! link Macro MrakYellow
hi! link TooLong MrakRed

" Standard syntax highhighing
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

" Spelling highhighing
call <sid>hi("SpellBad",     "", "lowest", "undercurl")
call <sid>hi("SpellLocal",   "", "lowest", "undercurl")
call <sid>hi("SpellCap",     "", "lowest", "undercurl")
call <sid>hi("SpellRare",    "", "lowest", "undercurl")
" Diagnostics
call <sid>hi("DiagnosticSignError"               , "red", "bottom", "")
call <sid>hi("DiagnosticSignWarn"                , "yellow", "bottom", "")
call <sid>hi("DiagnosticSignInfo"                , "blue", "bottom", "")
call <sid>hi("DiagnosticSignHint"                , "higher", "bottom", "")
call <sid>hi("DiagnosticError"                   , "red", "", "")
call <sid>hi("DiagnosticFloatingError"           , "red", "bottom", "")
call <sid>hi("DiagnosticWarn"                    , "yellow", "", "")
call <sid>hi("DiagnosticFloatingWarn"            , "yellow", "bottom", "")
call <sid>hi("DiagnosticInfo"                    , "blue", "", "")
call <sid>hi("DiagnosticFloatingInfo"            , "blue", "bottom", "")
call <sid>hi("DiagnosticHint"                    , "higher", "", "")
call <sid>hi("DiagnosticFloatingHint"            , "higher", "bottom", "")
call <sid>hi("DiagnosticFloatingOk"              , "", "bottom", "")
call <sid>hi("DiagnosticUnderlineError"          , "", "", 'undercurl')
call <sid>hi("DiagnosticUnderlineWarning"        , "", "", 'undercurl')
call <sid>hi("DiagnosticUnderlineWarn"           , "", "", 'undercurl')
call <sid>hi("DiagnosticUnderlineInformation"    , "", "", 'undercurl')
call <sid>hi("DiagnosticUnderlineHint"           , "", "", 'undercurl')
hi! link LspDiagnosticsDefaultError         DiagnosticError
hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
hi! link LspDiagnosticsDefaultHint          DiagnosticHint
hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarning
hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInformation
hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint

" Additional diff highhighing
call <sid>hi("DiffAdd",      "lowest", "green", "bold")
call <sid>hi("DiffChange",   "lowest", "purple", "bold")
call <sid>hi("DiffDelete",   "lowest", "", "")
call <sid>hi("DiffText",     "lowest", "purple", "bold")
call <sid>hi("DiffAdded",    "green", "", "")
call <sid>hi("DiffFile",     "cyan", "", "")
call <sid>hi("DiffNewFile",  "cyan", "", "bold")
call <sid>hi("DiffLine",     "blue", "", "")
call <sid>hi("DiffRemoved",  "red", "", "")
call <sid>hi("DiffSubname",  "high", "", "")

" treesitter
if has('nvim-0.8.0')
    hi! link @comment Comment
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

" Ruby highhighing
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

" PHP highhighing
hi! link phpVarSelector    MrakCyan
hi! link phpMemberSelector MrakHigher
hi! link phpComparison     MrakHigher
hi! link phpParent         MrakHigher
hi! link phpRegion         MrakHigher
hi! link phpStringSingle   MrakOrange
hi! link phpType           MrakYellow
hi! link phpDefine         MrakBlue
hi! link phpInclude        MrakRed

" HTML highhighing
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
call <sid>hi("htmlLink",      "blue", "", "undercurl")

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


" CSS highhighing
hi! link cssBraces        MrakHigher
hi! link cssClassName     MrakPurple
hi! link cssColor         MrakCyan

" SASS highhighing
hi! link sassidChar       MrakRed
hi! link sassClassChar    MrakOrange
hi! link sassInclude      MrakPurple
hi! link sassMixing       MrakPurple
hi! link sassMixinName    MrakBlue

" JavaScript highhighing
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

" Markdown highhighing
hi! link markdownCode               MrakCyan
hi! link markdownCodeBlock          MrakCyan
hi! link markdownHeadingDelimiter   MrakPurpleBold
call <sid>hi("markdownItalic",      "green", "", "italic")
hi! link markdownBold               MrakGreenBold

" Git highhighing
hi! link gitcommitOverflow         MrakRed
hi! link gitcommitSummary          MrakHighest
hi! link gitcommitFirstLine        MrakClear
hi! link gitcommitHeader           MrakBlue
hi! link gitcommitBranch           MrakCyan
hi! link gitcommitSelectedFile     MrakOrange
hi! link gitcommitSelectedType     MrakYellow

" GitGutter highhighing
call <sid>hi("GitGutterAdd",          "green", "lowest", "")
call <sid>hi("GitGutterChange",       "blue", "lowest", "")
call <sid>hi("GitGutterDelete",       "red", "lowest", "")
call <sid>hi("GitGutterChangeDelete", "purple", "lowest", "")

" Signify highhighing
call <sid>hi("SignifySignAdd",    "green", "lowest", "")
call <sid>hi("SignifySignChange", "blue", "lowest", "")
call <sid>hi("SignifySignDelete", "red", "lowest", "")

" Shell highhighing
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

" VimL highthighing
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

" NERDTree highhighing
hi! link NERDTreeDirSlash   MrakBlue
hi! link NERDTreeExecFile   MrakHigher
hi! link NERDTreeFile       MrakHigher

" CtrlP
call <sid>hi("CtrlPMatch",        "cyan", "", "underline")
call <sid>hi("CtrlPMode1",        "lower", "high", "bold")
call <sid>hi("CtrlPMode2",        "lower", "high", "bold")
hi! link CtrlPBufferNr       MrakHigh
hi! link CtrlPBufferInd      MrakGreen
hi! link CtrlPBufferHid      MrakHigh
hi! link CtrlPBufferHidMod   MrakRed
hi! link CtrlPBufferVis      MrakHigh
hi! link CtrlPBufferVisMod   MrakRed
hi! link CtrlPBufferPath     MrakHigh

" Syntastic
call <sid>hi("SyntasticWarningSign", "yellow", "bottom", "")
call <sid>hi("SyntasticErrorSign",   "red", "bottom", "")

" ALE
call <sid>hi("ALEInfoSign",    "blue", "bottom", "")
call <sid>hi("ALEWarningSign", "yellow", "bottom", "")
call <sid>hi("ALEErrorSign",   "red", "bottom", "")

" netrw
call <sid>hi("netrwMarkFile", "bottom", "green", "")
call <sid>hi("netrwTreeBar",  "low", "", "")

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

" Since 'Normal' resets the &background, do last
let s:background = &background
call <sid>hi("Normal", "highest", "lowest", "")
call <sid>hi("NormalNC", "highest", "bottom", "")
let &background = s:background
unlet s:background

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui
unlet s:cterm
