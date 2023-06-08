" Scheme: Eric Mrak (http://mrak.online)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak"
let s:gui = {"": "NONE", "none": "NONE"}
let s:cterm = {"": "NONE", "none": "NONE"}

if &background == "dark"
    call extend(s:gui, #{
    \  bottom  : "#1c1c1c" , red    : "#df5f87"
    \, lowest  : "#262626" , orange : "#d78700"
    \, lower   : "#303030" , yellow : "#ffd700"
    \, low     : "#444444" , green  : "#87af5f"
    \, high    : "#a8a8a8" , cyan   : "#00afaf"
    \, higher  : "#dadada" , blue   : "#87afff"
    \, highest : "#e4e4e4" , purple : "#af87ff"
    \, top     : "#f5f5f5" , brown  : "#875f00"
    \})
    call extend(s:cterm, #{
    \  bottom  : "234" , red    : "168"
    \, lowest  : "235" , orange : "172"
    \, lower   : "236" , yellow : "220"
    \, low     : "238" , green  : "107"
    \, high    : "248" , cyan   : "037"
    \, higher  : "253" , blue   : "111"
    \, highest : "254" , purple : "141"
    \, top     : "015" , brown  : "094"
    \})
    if &t_Co != 256
        call extend(s:cterm, #{
        \  bottom  : "000" , red    : "001"
        \, lowest  : "000" , orange : "001"
        \, lower   : "008" , yellow : "003"
        \, low     : "008" , green  : "002"
        \, high    : "007" , cyan   : "006"
        \, higher  : "007" , blue   : "004"
        \, highest : "015" , purple : "005"
        \, top     : "015" , brown  : "003"
        \})
    endif
else " &background == "light"
    call extend(s:gui, #{
    \  bottom  : "#f5f5f5" , red    : "#df005f"
    \, lowest  : "#e4e4e4" , orange : "#df5f00"
    \, lower   : "#dadada" , yellow : "#dfaf00"
    \, low     : "#a8a8a8" , green  : "#5faf5f"
    \, high    : "#444444" , cyan   : "#00afaf"
    \, higher  : "#303030" , blue   : "#5f87ff"
    \, highest : "#262626" , purple : "#af5fff"
    \, top     : "#1c1c1c" , brown  : "#875f00"
    \})
    call extend(s:cterm, #{
    \  bottom  : "015" , red    : "161"
    \, lowest  : "254" , orange : "166"
    \, lower   : "253" , yellow : "178"
    \, low     : "248" , green  : "071"
    \, high    : "238" , cyan   : "037"
    \, higher  : "236" , blue   : "069"
    \, highest : "235" , purple : "135"
    \, top     : "234" , brown  : "094"
    \})
    if &t_Co != 256
        call extend(s:cterm, #{
        \  bottom  : "015" , red    : "001"
        \, lowest  : "015" , orange : "001"
        \, lower   : "007" , yellow : "003"
        \, low     : "007" , green  : "002"
        \, high    : "008" , cyan   : "006"
        \, higher  : "008" , blue   : "004"
        \, highest : "000" , purple : "005"
        \, top     : "000" , brown  : "003"
        \})
    endif
endif

" Highlighting function
" parameters: (group, guifg, guibg, gui, guisp)
function s:hi(group, ...)
  let l:fg   = get(a:,1,0)
  let l:bg   = get(a:,2,0)
  let l:attr = get(a:,3,0)
  let l:afg  = get(a:,4,0)
  if l:attr is "" | let l:attr = "NONE" | endif

  let l:string = "hi " . a:group
  if l:fg   isnot 0 | let l:string .= " guifg=" . s:gui[l:fg] . " ctermfg=" . s:cterm[l:fg] | endif
  if l:bg   isnot 0 | let l:string .= " guibg=" . s:gui[l:bg] . " ctermbg=" . s:cterm[l:bg] | endif
  if l:attr isnot 0 | let l:string .= " gui=" . l:attr . " cterm=" . l:attr                 | endif
  if l:afg  isnot 0 | let l:string .= " guisp=" . s:gui[l:afg]                              | endif

  exec l:string
endfunction

" linkables
call s:hi("MrakBottom", "bottom", "", "")
call s:hi("MrakLowest", "lowest", "", "")
call s:hi("MrakLower",  "lower", "", "")
call s:hi("MrakLow",    "low", "", "")
call s:hi("MrakHigh",   "high", "", "")
call s:hi("MrakHigher", "higher", "", "")
call s:hi("MrakHighest","highest", "", "")
call s:hi("MrakTop",    "top", "", "")
call s:hi("MrakRed",    "red", "", "")
call s:hi("MrakOrange", "orange", "", "")
call s:hi("MrakYellow", "yellow", "", "")
call s:hi("MrakGreen",  "green", "", "")
call s:hi("MrakCyan",   "cyan", "", "")
call s:hi("MrakBlue",   "blue", "", "")
call s:hi("MrakPurple", "purple", "", "")
call s:hi("MrakBrown",  "brown", "", "")
" linkables style
call s:hi("MrakReverse",  "", "", "reverse")
call s:hi("MrakClear",  "", "", "")
call s:hi("MrakBold",  "", "", "bold")
call s:hi("MrakItalic",  "", "", "italic")
" linkables bold
call s:hi("MrakBottomBold", "bottom", "", "bold")
call s:hi("MrakLowestBold", "lowest", "", "bold")
call s:hi("MrakLowerBold",  "lower", "", "bold")
call s:hi("MrakLowBold",    "low", "", "bold")
call s:hi("MrakHighBold",   "high", "", "bold")
call s:hi("MrakHigherBold", "higher", "", "bold")
call s:hi("MrakHighestBold","highest", "", "bold")
call s:hi("MrakTopBold",    "top", "", "bold")
call s:hi("MrakRedBold",    "red", "", "bold")
call s:hi("MrakOrangeBold", "orange", "", "bold")
call s:hi("MrakYellowBold", "yellow", "", "bold")
call s:hi("MrakGreenBold",  "green", "", "bold")
call s:hi("MrakCyanBold",   "cyan", "", "bold")
call s:hi("MrakBlueBold",   "blue", "", "bold")
call s:hi("MrakPurpleBold", "purple", "", "bold")
call s:hi("MrakBrownBold",  "brown", "", "bold")
" linkables test
call s:hi("MrakTestUnderline",     "low", "bottom", "underline",     "red")
call s:hi("MrakTestUndercurl",     "low", "bottom", "undercurl",     "red")
call s:hi("MrakTestUnderdouble",   "low", "bottom", "underdouble",   "red")
call s:hi("MrakTestUnderdotted",   "low", "bottom", "underdotted",   "red")
call s:hi("MrakTestUnderdashed",   "low", "bottom", "underdashed",   "red")
call s:hi("MrakTestStrikethrough", "low", "bottom", "strikethrough", "red")

" Vim editor colors
call s:hi("Cursor",        "bottom", "top", "")
call s:hi("CursorColumn",  "", "bottom", "")
call s:hi("CursorLine",    "", "bottom", "")
call s:hi("LineNr",        "low", "bottom", "")
call s:hi("CursorLineNr",  "low", "bottom", "")
call s:hi("VertSplit",     "bottom", "bottom", "none")
call s:hi("NonText",       "low", "", "")
call s:hi("EndOfBuffer",   "bottom", "bottom", "")
call s:hi("StatusLine",    "lowest", "high", "bold")
call s:hi("StatusLineNor", "lowest", "high", "bold")
call s:hi("StatusLineIns", "lowest", "green", "bold")
call s:hi("StatusLineRep", "lowest", "purple", "bold")
call s:hi("StatusLineVRep","lowest", "purple", "bold")
call s:hi("StatusLineNC",  "low", "bottom", "bold")
hi! link FoldColumn LineNr
call s:hi("Folded",        "low", "bottom", "")
call s:hi("IncSearch",     "lowest", "orange", "none")
call s:hi("Bold",          "", "", "bold")
call s:hi("Italic",        "", "", "italic")
call s:hi("ModeMsg",       "green", "", "")
call s:hi("MoreMsg",       "green", "", "")
call s:hi("Question",      "yellow", "", "")
call s:hi("Search",        "", "",  "reverse")
call s:hi("MatchParen",    "lowest", "high",  "")
call s:hi("Underlined",    "red", "", "")
call s:hi("Visual",        "top", "low", "")
call s:hi("VisualNOS",     "red", "", "reverse")
call s:hi("WarningMsg",    "red", "", "")
call s:hi("WildMenu",      "red", "", "")
call s:hi("Title",         "blue", "", "none")
call s:hi("Conceal",       "blue", "lowest", "")
hi! link SignColumn LineNr
call s:hi("SpecialKey",    "low", "", "")
call s:hi("ColorColumn",   "low", "lowest", "none")
call s:hi("PMenu",         "high", "bottom", "none")
call s:hi("PMenuSel",      "lowest", "green", "")
call s:hi("TabLine",       "low", "bottom", "none")
call s:hi("TabLineFill",   "low", "bottom", "none")
call s:hi("TabLineSel",    "green", "lowest", "none")

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
call s:hi("SpellBad",     "", "", "undercurl", "red")
call s:hi("SpellLocal",   "", "", "undercurl", "orange")
call s:hi("SpellCap",     "", "", "undercurl", "blue")
call s:hi("SpellRare",    "", "", "undercurl", "green")
" Diagnostics
call s:hi("DiagnosticSignError"               , "red", "bottom", "")
call s:hi("DiagnosticSignWarn"                , "yellow", "bottom", "")
call s:hi("DiagnosticSignInfo"                , "blue", "bottom", "")
call s:hi("DiagnosticSignHint"                , "higher", "bottom", "")
call s:hi("DiagnosticError"                   , "red", "", "")
call s:hi("DiagnosticFloatingError"           , "red", "bottom", "")
call s:hi("DiagnosticWarn"                    , "yellow", "", "")
call s:hi("DiagnosticFloatingWarn"            , "yellow", "bottom", "")
call s:hi("DiagnosticInfo"                    , "blue", "", "")
call s:hi("DiagnosticFloatingInfo"            , "blue", "bottom", "")
call s:hi("DiagnosticHint"                    , "higher", "", "")
call s:hi("DiagnosticFloatingHint"            , "higher", "bottom", "")
call s:hi("DiagnosticFloatingOk"              , "", "bottom", "")
call s:hi("DiagnosticUnderlineError"          , "", "", 'undercurl')
call s:hi("DiagnosticUnderlineWarning"        , "", "", 'undercurl')
call s:hi("DiagnosticUnderlineWarn"           , "", "", 'undercurl')
call s:hi("DiagnosticUnderlineInformation"    , "", "", 'undercurl')
call s:hi("DiagnosticUnderlineHint"           , "", "", 'undercurl')
hi! link LspDiagnosticsDefaultError         DiagnosticError
hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
hi! link LspDiagnosticsDefaultHint          DiagnosticHint
hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarning
hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInformation
hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
call s:hi('LspInfoBorder', 'green', 'bottom', '')

" Diff mode
call s:hi("DiffAdd",      "lowest", "green", "bold")
call s:hi("DiffChange",   "lowest", "purple", "")
call s:hi("DiffDelete",   "lowest", "red", "bold")
call s:hi("DiffText",     "lowest", "purple", "bold,underline")
" Additional diff highlighting
call s:hi("DiffAdded",    "green", "", "bold")
call s:hi("DiffFile",     "low", "", "")
call s:hi("diffOldFile",  "brown", "", "")
call s:hi("DiffNewFile",  "orange", "", "")
call s:hi("DiffLine",     "cyan", "", "")
call s:hi("DiffRemoved",  "red", "", "bold")
call s:hi("DiffSubname",  "high", "", "")
call s:hi("diffIndexLine","purple", "", "")

hi! link DirvishArg MrakOrangeBold

hi! link LeapBackdrop Comment
call s:hi("Sneak", "bottom", "green", "")

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
    " yaml
    hi! link @field.yaml MrakHighest

    " terraform
    hi! link @variable.builtin.terraform MrakRed
    hi! link @type.terraform NONE
    hi! link @lsp.type.type.terraform NONE
    hi! link @lsp.type.keyword.terraform NONE
    hi! link @lsp.type.property.terraform MrakBlue
    hi! link @lsp.type.enumMember.terraform MrakOrange
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
call s:hi("htmlLink",      "blue", "", "undercurl")

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
call s:hi("markdownItalic",      "green", "", "italic")
hi! link markdownBold               MrakGreenBold

" Git highlighting
hi! link gitcommitOverflow         MrakRed
hi! link gitcommitSummary          MrakHighest
hi! link gitcommitFirstLine        MrakClear
hi! link gitcommitHeader           MrakBlue
hi! link gitcommitBranch           MrakCyan
hi! link gitcommitSelectedFile     MrakOrange
hi! link gitcommitSelectedType     MrakYellow

" GitGutter highlighting
call s:hi("GitGutterAdd",          "green", "lowest", "")
call s:hi("GitGutterChange",       "blue", "lowest", "")
call s:hi("GitGutterDelete",       "red", "lowest", "")
call s:hi("GitGutterChangeDelete", "purple", "lowest", "")

" Signify highlighting
call s:hi("SignifySignAdd",    "green", "lowest", "")
call s:hi("SignifySignChange", "blue", "lowest", "")
call s:hi("SignifySignDelete", "red", "lowest", "")

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
call s:hi("CtrlPMatch",        "cyan", "", "underline")
call s:hi("CtrlPMode1",        "lower", "high", "bold")
call s:hi("CtrlPMode2",        "lower", "high", "bold")
hi! link CtrlPBufferNr       MrakHigh
hi! link CtrlPBufferInd      MrakGreen
hi! link CtrlPBufferHid      MrakHigh
hi! link CtrlPBufferHidMod   MrakRed
hi! link CtrlPBufferVis      MrakHigh
hi! link CtrlPBufferVisMod   MrakRed
hi! link CtrlPBufferPath     MrakHigh

" Syntastic
call s:hi("SyntasticWarningSign", "yellow", "bottom", "")
call s:hi("SyntasticErrorSign",   "red", "bottom", "")

" ALE
call s:hi("ALEInfoSign",    "blue", "bottom", "")
call s:hi("ALEWarningSign", "yellow", "bottom", "")
call s:hi("ALEErrorSign",   "red", "bottom", "")

" netrw
call s:hi("netrwMarkFile", "bottom", "green", "")
call s:hi("netrwTreeBar",  "low", "", "")

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
call s:hi("FernMarkedText", "orange", "bottom", "bold")
hi! link FernMarkedLine MrakOrangeBold
hi! link FernBranchSymbol MrakHigh
hi! link FernLeafSymbol MrakLow

" Since 'Normal' resets the &background, do last
let s:background = &background
call s:hi("Normal", "highest", "lowest", "")
call s:hi("NormalNC", "highest", "bottom", "")
let &background = s:background
unlet s:background

" Remove functions
delf s:hi

" Remove color variables
unlet s:gui
unlet s:cterm
