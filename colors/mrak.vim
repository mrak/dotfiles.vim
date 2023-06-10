" Scheme: Eric Mrak (http://mrak.online)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak"
let s:gui   = {}
let s:cterm = {}

eval s:gui->extend(g:->get('mrak#palette#'.&background.'_gui'))->extend(g:->get('mrak_palette_'.&background.'_gui', {}))
eval s:cterm->extend(g:->get('mrak#palette#'.&background.'_256'))->extend(g:->get('mrak_palette_'.&background.'_256', {}))
if &t_Co != 256
  eval s:cterm->extend(g:->get('mrak#palette#'.&background.'_16'))->extend(g:->get('mrak_palette_'.&background.'_16', {}))
endif

function s:hl(group, settings)
  let l:fg = get(a:settings,"fg","none")
  let l:bg = get(a:settings,"bg","none")
  let l:at = get(a:settings,"at","none")
  let l:sp = get(a:settings,"sp","none")
  exe "hi" a:group "guifg=".s:gui[l:fg] "guibg=".s:gui[l:bg] "gui=".l:at "guisp=".s:gui[l:sp] "ctermfg=".s:cterm[l:fg] "ctermbg=".s:cterm[l:bg] "cterm=".l:at
endfunction

" linkables
call s:hl("MrakBottom", #{fg:"bottom"})
call s:hl("MrakLowest", #{fg:"lowest"})
call s:hl("MrakLower",  #{fg:"lower"})
call s:hl("MrakLow",    #{fg:"low"})
call s:hl("MrakHigh",   #{fg:"high"})
call s:hl("MrakHigher", #{fg:"higher"})
call s:hl("MrakHighest",#{fg:"highest"})
call s:hl("MrakTop",    #{fg:"top"})
call s:hl("MrakRed",    #{fg:"red"})
call s:hl("MrakOrange", #{fg:"orange"})
call s:hl("MrakYellow", #{fg:"yellow"})
call s:hl("MrakGreen",  #{fg:"green"})
call s:hl("MrakCyan",   #{fg:"cyan"})
call s:hl("MrakBlue",   #{fg:"blue"})
call s:hl("MrakPurple", #{fg:"purple"})
call s:hl("MrakBrown",  #{fg:"brown"})
" linkables style
call s:hl("MrakReverse",#{at:"reverse"})
call s:hl("MrakClear",  #{})
call s:hl("MrakBold",   #{at:"bold"})
call s:hl("MrakItalic", #{at:"italic"})
" linkables bold
call s:hl("MrakBottomBold", #{fg:"bottom",  at:"bold"})
call s:hl("MrakLowestBold", #{fg:"lowest",  at:"bold"})
call s:hl("MrakLowerBold",  #{fg:"lower",   at:"bold"})
call s:hl("MrakLowBold",    #{fg:"low",     at:"bold"})
call s:hl("MrakHighBold",   #{fg:"high",    at:"bold"})
call s:hl("MrakHigherBold", #{fg:"higher",  at:"bold"})
call s:hl("MrakHighestBold",#{fg:"highest", at:"bold"})
call s:hl("MrakTopBold",    #{fg:"top",     at:"bold"})
call s:hl("MrakRedBold",    #{fg:"red",     at:"bold"})
call s:hl("MrakOrangeBold", #{fg:"orange",  at:"bold"})
call s:hl("MrakYellowBold", #{fg:"yellow",  at:"bold"})
call s:hl("MrakGreenBold",  #{fg:"green",   at:"bold"})
call s:hl("MrakCyanBold",   #{fg:"cyan",    at:"bold"})
call s:hl("MrakBlueBold",   #{fg:"blue",    at:"bold"})
call s:hl("MrakPurpleBold", #{fg:"purple",  at:"bold"})
call s:hl("MrakBrownBold",  #{fg:"brown",   at:"bold"})
" linkables test
call s:hl("MrakTestUnderline",     #{fg:"low", bg:"bottom", at:"underline",     sp:"red"})
call s:hl("MrakTestUndercurl",     #{fg:"low", bg:"bottom", at:"undercurl",     sp:"red"})
call s:hl("MrakTestUnderdouble",   #{fg:"low", bg:"bottom", at:"underdouble",   sp:"red"})
call s:hl("MrakTestUnderdotted",   #{fg:"low", bg:"bottom", at:"underdotted",   sp:"red"})
call s:hl("MrakTestUnderdashed",   #{fg:"low", bg:"bottom", at:"underdashed",   sp:"red"})
call s:hl("MrakTestStrikethrough", #{fg:"low", bg:"bottom", at:"strikethrough", sp:"red"})
" Vim editor colors
call s:hl("Cursor",        #{fg:"bottom", bg:"top"})
call s:hl("CursorColumn",  #{             bg:"bottom"})
call s:hl("CursorLine",    #{             bg:"bottom"})
call s:hl("LineNr",        #{fg:"low",    bg:"bottom"})
call s:hl("CursorLineNr",  #{fg:"low",    bg:"bottom"})
call s:hl("VertSplit",     #{fg:"bottom", bg:"bottom"})
hi! link NonText MrakLow
call s:hl("EndOfBuffer",   #{fg:"bottom", bg:"bottom"})
call s:hl("StatusLine",    #{fg:"lowest", bg:"high",   at:"bold"})
call s:hl("StatusLineNor", #{fg:"lowest", bg:"high",   at:"bold"})
call s:hl("StatusLineIns", #{fg:"lowest", bg:"green",  at:"bold"})
call s:hl("StatusLineRep", #{fg:"lowest", bg:"purple", at:"bold"})
call s:hl("StatusLineVRep",#{fg:"lowest", bg:"purple", at:"bold"})
call s:hl("StatusLineNC",  #{fg:"low",    bg:"bottom", at:"bold"})
hi! link FoldColumn LineNr
call s:hl("Folded",        #{fg:"low", bg:"bottom"})
call s:hl("IncSearch",     #{fg:"lowest", bg:"orange"})
hi! link Bold     MrakBold
hi! link Italic   MrakItalic
hi! link ModeMsg  MrakGreen
hi! link MoreMsg  MrakGreen
hi! link Question MrakYellow
hi! link Search   MrakReverse
call s:hl("MatchParen",    #{fg:"lowest", bg:"high"})
hi! link Underlined      MrakRed
call s:hl("Visual",        #{fg:"top", bg:"low"})
call s:hl("VisualNOS",     #{fg:"red", at:"reverse"})
hi! link WarningMsg      MrakRed
hi! link WildMenu        MrakRed
hi! link Title           MrakBlue
call s:hl("Conceal",       #{fg:"blue", bg:"lowest"})
hi! link SignColumn LineNr
hi! link SpecialKey MrakLow
call s:hl("ColorColumn", #{fg:"low",    bg:"lowest"})
call s:hl("PMenu",       #{fg:"high",   bg:"bottom"})
call s:hl("PMenuSel",    #{fg:"lowest", bg:"green"})
call s:hl("TabLine",     #{fg:"low",    bg:"bottom"})
call s:hl("TabLineFill", #{fg:"low",    bg:"bottom"})
call s:hl("TabLineSel",  #{fg:"green",  bg:"lowest"})

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
call s:hl("SpellBad",   #{at:"undercurl", sp:"red"})
call s:hl("SpellLocal", #{at:"undercurl", sp:"orange"})
call s:hl("SpellCap",   #{at:"undercurl", sp:"blue"})
call s:hl("SpellRare",  #{at:"undercurl", sp:"green"})
" Diagnostics
hi! link DiagnosticError MrakRed
hi! link DiagnosticWarn  MrakYellow
hi! link DiagnosticInfo  MrakBlue
hi! link DiagnosticHint  MrakHigher
call s:hl("DiagnosticSignError"           , #{fg:"red",    bg:"bottom"})
call s:hl("DiagnosticSignWarn"            , #{fg:"yellow", bg:"bottom"})
call s:hl("DiagnosticSignInfo"            , #{fg:"blue",   bg:"bottom"})
call s:hl("DiagnosticSignHint"            , #{fg:"higher", bg:"bottom"})
call s:hl("DiagnosticFloatingError"       , #{fg:"red",    bg:"bottom"})
call s:hl("DiagnosticFloatingWarn"        , #{fg:"yellow", bg:"bottom"})
call s:hl("DiagnosticFloatingInfo"        , #{fg:"blue",   bg:"bottom"})
call s:hl("DiagnosticFloatingHint"        , #{fg:"higher", bg:"bottom"})
call s:hl("DiagnosticFloatingOk"          , #{bg:"bottom"})
call s:hl("DiagnosticUnderlineError"      , #{at:'undercurl'})
call s:hl("DiagnosticUnderlineWarning"    , #{at:'undercurl'})
call s:hl("DiagnosticUnderlineWarn"       , #{at:'undercurl'})
call s:hl("DiagnosticUnderlineInformation", #{at:'undercurl'})
call s:hl("DiagnosticUnderlineHint"       , #{at:'undercurl'})
hi! link LspDiagnosticsDefaultError         DiagnosticError
hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
hi! link LspDiagnosticsDefaultHint          DiagnosticHint
hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarning
hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInformation
hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
call s:hl('LspInfoBorder', #{fg:'green', bg:'bottom'})

" Diff mode
call s:hl("DiffAdd",    #{fg:"lowest", bg:"green",  at:"bold"})
call s:hl("DiffChange", #{fg:"lowest", bg:"purple"})
call s:hl("DiffDelete", #{fg:"lowest", bg:"red",    at:"bold"})
call s:hl("DiffText",   #{fg:"lowest", bg:"purple", at:"bold,underline"})
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
call s:hl("Sneak", #{fg:"bottom", bg:"green"})

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
call s:hl("htmlLink", #{fg:"blue", at:"undercurl"})

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
call s:hl("markdownItalic", #{fg:"green", at:"italic"})

" Git highlighting
hi! link gitcommitOverflow         MrakRed
hi! link gitcommitSummary          MrakHighest
hi! link gitcommitFirstLine        MrakClear
hi! link gitcommitHeader           MrakBlue
hi! link gitcommitBranch           MrakCyan
hi! link gitcommitSelectedFile     MrakOrange
hi! link gitcommitSelectedType     MrakYellow

" GitGutter highlighting
call s:hl("GitGutterAdd",          #{fg:"green",  bg:"lowest"})
call s:hl("GitGutterChange",       #{fg:"blue",   bg:"lowest"})
call s:hl("GitGutterDelete",       #{fg:"red",    bg:"lowest"})
call s:hl("GitGutterChangeDelete", #{fg:"purple", bg:"lowest"})

" Signify highlighting
call s:hl("SignifySignAdd",    #{fg:"green", bg:"lowest"})
call s:hl("SignifySignChange", #{fg:"blue",  bg:"lowest"})
call s:hl("SignifySignDelete", #{fg:"red",   bg:"lowest"})

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
call s:hl("CtrlPMatch",      #{fg:"cyan", at:"underline"})
call s:hl("CtrlPMode1",      #{fg:"lower", bg:"high", at:"bold"})
call s:hl("CtrlPMode2",      #{fg:"lower", bg:"high", at:"bold"})
hi! link CtrlPBufferNr       MrakHigh
hi! link CtrlPBufferInd      MrakGreen
hi! link CtrlPBufferHid      MrakHigh
hi! link CtrlPBufferHidMod   MrakRed
hi! link CtrlPBufferVis      MrakHigh
hi! link CtrlPBufferVisMod   MrakRed
hi! link CtrlPBufferPath     MrakHigh

" Syntastic
call s:hl("SyntasticWarningSign", #{fg:"yellow", bg:"bottom"})
call s:hl("SyntasticErrorSign",   #{fg:"red", bg:"bottom"})

" ALE
call s:hl("ALEInfoSign",    #{fg:"blue",   bg:"bottom"})
call s:hl("ALEWarningSign", #{fg:"yellow", bg:"bottom"})
call s:hl("ALEErrorSign",   #{fg:"red",    bg:"bottom"})

" netrw
call s:hl("netrwMarkFile", #{fg:"bottom", bg:"green"})
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
call s:hl("FernMarkedText", #{fg:"orange", bg:"bottom", at:"bold"})
hi! link FernMarkedLine MrakOrangeBold
hi! link FernBranchSymbol MrakHigh
hi! link FernLeafSymbol MrakLow

" Since 'Normal' resets the &background, do last
let s:background = &background
call s:hl("Normal",   #{fg:"highest", bg:"lowest"})
call s:hl("NormalNC", #{fg:"highest", bg:"bottom"})
let &background = s:background
unlet s:background

" Remove functions
delf s:hl

" Remove color variables
unlet s:gui
unlet s:cterm
