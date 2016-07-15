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

" Vim editor colors
call <sid>hi("Cursor",        "bottom", "top", "")
call <sid>hi("CursorColumn",  "low", "bottom", "none")
call <sid>hi("CursorLine",    "", "lower", "")
call <sid>hi("LineNr",        "low", "bottom", "")
call <sid>hi("CursorLineNr",  "low", "bottom", "")
call <sid>hi("VertSplit",     "bottom", "bottom", "none")
call <sid>hi("NonText",       "low", "", "")
if has('nvim')
call <sid>hi("EndOfBuffer",   "lowest", "", "")
endif
call <sid>hi("StatusLine",    "lowest", "high", "bold")
call <sid>hi("StatusLineNor", "lowest", "high", "bold")
call <sid>hi("StatusLineIns", "lowest", "green", "bold")
call <sid>hi("StatusLineRep", "lowest", "purple", "bold")
call <sid>hi("StatusLineVRep","lowest", "purple", "bold")
call <sid>hi("StatusLineNC",  "low", "bottom", "")
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Debug",         "red", "", "")
call <sid>hi("Directory",     "blue", "", "")
call <sid>hi("Error",         "red", "", "bold")
call <sid>hi("ErrorMsg",      "red", "", "bold")
call <sid>hi("Exception",     "blue", "", "")
call <sid>hi("FoldColumn",    "", "lowest", "")
call <sid>hi("Folded",        "low", "bottom", "")
call <sid>hi("IncSearch",     "lowest", "orange", "none")
call <sid>hi("Italic",        "", "", "none")
call <sid>hi("Macro",         "yellow", "", "")
call <sid>hi("MatchParen",    "lowest", "high",  "")
call <sid>hi("ModeMsg",       "green", "", "")
call <sid>hi("MoreMsg",       "green", "", "")
call <sid>hi("Question",      "yellow", "", "")
call <sid>hi("Search",        "", "",  "reverse")
call <sid>hi("TooLong",       "red", "", "")
call <sid>hi("Underlined",    "red", "", "")
call <sid>hi("Visual",        "top", "low", "")
call <sid>hi("VisualNOS",     "red", "", "reverse")
call <sid>hi("WarningMsg",    "red", "", "")
call <sid>hi("WildMenu",      "red", "", "")
call <sid>hi("Title",         "blue", "", "none")
call <sid>hi("Conceal",       "blue", "lowest", "")
call <sid>hi("SignColumn",    "low", "lowest", "")
call <sid>hi("SpecialKey",    "low", "", "")
call <sid>hi("ColorColumn",   "low", "lowest", "none")
call <sid>hi("PMenu",         "high", "low", "none")
call <sid>hi("PMenuSel",      "lowest", "green", "")
call <sid>hi("TabLine",       "low", "lowest", "none")
call <sid>hi("TabLineFill",   "low", "lowest", "none")
call <sid>hi("TabLineSel",    "green", "lowest", "none")

" Standard syntax highhighing
call <sid>hi("Boolean",      "red", "", "")
call <sid>hi("Character",    "orange", "", "")
call <sid>hi("Comment",      "low", "", "")
call <sid>hi("Conditional",  "blue", "", "")
call <sid>hi("Constant",     "red", "", "")
call <sid>hi("Define",       "yellow", "", "none")
call <sid>hi("PreCondit",    "yellow", "", "none")
call <sid>hi("Delimiter",    "cyan", "", "")
call <sid>hi("Float",        "red", "", "")
call <sid>hi("Function",     "green", "", "")
call <sid>hi("Identifier",   "green", "", "none")
call <sid>hi("Include",      "yellow", "", "")
call <sid>hi("Keyword",      "blue", "", "")
call <sid>hi("Label",        "blue", "", "")
call <sid>hi("Number",       "red", "", "")
call <sid>hi("Operator",     "cyan", "", "none")
call <sid>hi("PreProc",      "yellow", "", "")
call <sid>hi("Repeat",       "blue", "", "")
call <sid>hi("Special",      "cyan", "", "")
call <sid>hi("SpecialChar",  "cyan", "", "")
call <sid>hi("Statement",    "blue", "", "")
call <sid>hi("StorageClass", "purple", "", "")
call <sid>hi("String",       "orange", "", "")
call <sid>hi("Structure",    "purple", "", "")
call <sid>hi("Tag",          "cyan", "", "")
call <sid>hi("Todo",         "yellow", "lowest", "")
call <sid>hi("Type",         "purple", "", "none")
call <sid>hi("Typedef",      "purple", "", "")

" Spelling highhighing
call <sid>hi("SpellBad",     "", "lowest", "undercurl")
call <sid>hi("SpellLocal",   "", "lowest", "undercurl")
call <sid>hi("SpellCap",     "", "lowest", "undercurl")
call <sid>hi("SpellRare",    "", "lowest", "undercurl")

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

" Ruby highhighing
call <sid>hi("rubyAttribute",               "blue", "", "")
call <sid>hi("rubyConstant",                "green", "", "")
call <sid>hi("rubyInterpolation",           "green", "", "")
call <sid>hi("rubyInterpolationDelimiter",  "purple", "", "")
call <sid>hi("rubyRegexp",                  "cyan", "", "")
call <sid>hi("rubySymbol",                  "cyan", "", "")
call <sid>hi("rubyStringDelimiter",         "orange", "", "")
call <sid>hi("rubyClass",                   "red", "", "")
call <sid>hi("rubyDefine",                  "red", "", "")
call <sid>hi("rubyInclude",                 "red", "", "")
call <sid>hi("rubySharpBang",               "low", "", "")
call <sid>hi("rubyControl",                 "blue", "", "")
call <sid>hi("rubyExceptional",             "blue", "", "")
call <sid>hi("rubyFunction",                "yellow", "", "")

" PHP highhighing
call <sid>hi("phpVarSelector",     "cyan", "", "")
call <sid>hi("phpMemberSelector",  "higher", "", "")
call <sid>hi("phpComparison",      "higher", "", "")
call <sid>hi("phpParent",          "higher", "", "")
call <sid>hi("phpRegion",          "higher", "", "")
call <sid>hi("phpStringSingle",    "orange", "", "")
call <sid>hi("phpType",            "yellow", "", "")
call <sid>hi("phpDefine",          "blue", "", "")
call <sid>hi("phpInclude",         "red", "", "")

" HTML highhighing
call <sid>hi("htmlBold",           "yellow", "", "")
call <sid>hi("htmlItalic",         "purple", "", "")
call <sid>hi("htmlEndTag",         "higher", "", "")
call <sid>hi("htmlTag",            "higher", "", "")
call <sid>hi("htmlTagName",        "green", "", "")
call <sid>hi("htmlArg",            "cyan", "", "")
call <sid>hi("htmlSpecialTagName", "blue", "", "")
call <sid>hi("htmlTitle",          "", "", "bold")
call <sid>hi("htmlH1",             "", "", "bold")
call <sid>hi("htmlItalic",         "", "", "italic")
call <sid>hi("htmlBold",           "", "", "bold")
call <sid>hi("htmlLink",           "blue", "", "undercurl")

" Perl
call <sid>hi("perlMethod",            "", "", "")
call <sid>hi("perlVarPlain",          "green", "", "")
call <sid>hi("perlVarPlain2",         "green", "", "")
call <sid>hi("perlStatementStorage",  "red", "", "")
call <sid>hi("perlStatementInclude",  "red", "", "")
call <sid>hi("perlStatementFileDesc", "cyan", "", "")
call <sid>hi("perlStatementRegexp",   "cyan", "", "")
call <sid>hi("perlMatchStartEnd",     "cyan", "", "")
call <sid>hi("perlSpecialString",     "purple", "", "")


" CSS highhighing
call <sid>hi("cssBraces",      "higher", "", "")
call <sid>hi("cssClassName",   "purple", "", "")
call <sid>hi("cssColor",       "cyan", "", "")

" SASS highhighing
call <sid>hi("sassidChar",     "red", "", "")
call <sid>hi("sassClassChar",  "orange", "", "")
call <sid>hi("sassInclude",    "purple", "", "")
call <sid>hi("sassMixing",     "purple", "", "")
call <sid>hi("sassMixinName",  "blue", "", "")

" JavaScript highhighing
call <sid>hi("javaScript",             "higher", "", "")
call <sid>hi("jsFuncCall",             "green", "", "")
call <sid>hi("jsOperator",             "blue", "", "")
call <sid>hi("jsPrototype",            "cyan", "", "")
call <sid>hi("javaScriptNumber",       "red", "", "")
call <sid>hi("jsNumber",               "red", "", "")
call <sid>hi("javaScriptFuncArg",      "cyan", "", "bold")
call <sid>hi("jsFuncArgs",             "", "", "")
call <sid>hi("javaScriptFunction",     "yellow", "", "")
call <sid>hi("jsFunction",             "blue", "", "")
call <sid>hi("javaScriptFuncKeyword",  "yellow", "", "")
call <sid>hi("javaScriptFuncDef",      "cyan", "", "")
call <sid>hi("javaScriptParens",       "", "", "bold")
call <sid>hi("jsParens",               "", "", "bold")
call <sid>hi("javaScriptBraces",       "cyan", "", "")
call <sid>hi("jsBraces",               "cyan", "", "")
call <sid>hi("jsFuncBraces",           "cyan", "", "")
call <sid>hi("javaScriptEndColons",    "", "", "")
call <sid>hi("javaScriptBoolean",      "red", "", "")
call <sid>hi("jsBooleanFalse",         "yellow", "", "")
call <sid>hi("jsBooleanTrue",          "yellow", "", "")
call <sid>hi("javaScriptException",    "blue", "", "")
call <sid>hi("javaScriptGlobal",       "purple", "", "")
call <sid>hi("jsGlobalObjects",        "cyan", "", "")
call <sid>hi("jsThis",                 "cyan", "", "")
call <sid>hi("jsBuiltins",             "purple", "", "")
call <sid>hi("javaScriptIdentifier",   "green", "", "")
call <sid>hi("jsStorageClass",         "blue", "", "")
call <sid>hi("jsNull",                 "purple", "", "")
call <sid>hi("jsUndefined",            "purple", "", "")
call <sid>hi("javaScriptRegexpString", "orange", "", "")

" Python
call <sid>hi("pythonInclude",   "red", "", "")
call <sid>hi("pythonStatement", "green", "", "")
call <sid>hi("pythonFunction",  "cyan", "", "")
call <sid>hi("pythonBuiltin",   "blue", "", "")

" Markdown highhighing
call <sid>hi("markdownCode",             "cyan", "", "")
call <sid>hi("markdownCodeBlock",        "cyan", "", "")
call <sid>hi("markdownHeadingDelimiter", "purple", "", "bold")
call <sid>hi("markdownItalic",           "green", "", "italic")
call <sid>hi("markdownBold",             "green", "", "bold")

" Git highhighing
call <sid>hi("gitcommitOverflow", "red", "", "")
call <sid>hi("gitcommitSummary",  "highest", "", "")
call <sid>hi("gitcommitFirstLine",  "", "", "")
call <sid>hi("gitcommitHeader",   "blue", "", "")
call <sid>hi("gitcommitBranch",   "cyan", "", "")
call <sid>hi("gitcommitSelectedFile",   "orange", "", "")
call <sid>hi("gitcommitSelectedType",   "yellow", "", "")

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
call <sid>hi("shShellVariables", "purple", "", "")
call <sid>hi("shQuote", "orange", "", "")
call <sid>hi("shOption", "", "", "bold")
call <sid>hi("shNumber", "orange", "", "")
call <sid>hi("shCmdSubRegion", "red", "", "bold")

" Fish
call <sid>hi("fishCommandSub", "cyan", "", "")
call <sid>hi("fishConditional", "blue", "", "")

" Haskell
call <sid>hi("hsImport",    "red", "", "")
call <sid>hi("hsPragma",    "purple", "", "")
call <sid>hi("hsDelimiter", "cyan", "", "")
call <sid>hi("hsModule",    "blue", "", "")
call <sid>hi("hsStructure", "blue", "", "")
call <sid>hi("VarId",       "", "", "")
call <sid>hi("ConId",       "green", "", "")
" haskell-vim
call <sid>hi("haskellImportKeywords", "red", "", "")
call <sid>hi("haskellType", "green", "", "")
call <sid>hi("haskellIdentifier", "high", "", "")

" VimL highthighing
call <sid>hi("vimOption", "cyan", "", "")
call <sid>hi("vimVar", "green", "", "")
call <sid>hi("vimEnvVar", "green", "", "")
call <sid>hi("vimFuncName", "red", "", "")
call <sid>hi("vimFunction", "red", "", "")
call <sid>hi("vimIsCommand", "yellow", "", "")
call <sid>hi("vimUserFunc", "red", "", "")
call <sid>hi("vimAutoEvent", "green", "", "")
call <sid>hi("vimMapMod", "purple", "", "")
call <sid>hi("vimMapModKey", "purple", "", "")
call <sid>hi("vimNotation", "cyan", "", "")
call <sid>hi("helpNotVi", "red","","")
call <sid>hi("helpSectionDelim", "red","","")
call <sid>hi("helpSpecial", "purple","","")
call <sid>hi("helpOption", "cyan","","")
call <sid>hi("helpHeader", "blue","","")

" NERDTree highhighing
call <sid>hi("NERDTreeDirSlash", "blue", "", "")
call <sid>hi("NERDTreeExecFile", "higher", "", "")

" CtrlP
call <sid>hi("CtrlPMatch",        "cyan", "", "underline")
call <sid>hi("CtrlPMode1",        "lower", "high", "bold")
call <sid>hi("CtrlPMode2",        "lower", "high", "bold")
call <sid>hi("CtrlPBufferNr",     "high", "", "")
call <sid>hi("CtrlPBufferInd",    "green", "", "")
call <sid>hi("CtrlPBufferHid",    "high", "", "")
call <sid>hi("CtrlPBufferHidMod", "red", "", "")
call <sid>hi("CtrlPBufferVis",    "high", "", "bold")
call <sid>hi("CtrlPBufferVisMod", "red", "", "bold")
call <sid>hi("CtrlPBufferPath",   "high", "", "")

" Syntastic
call <sid>hi("SyntasticWarningSign", "yellow", "bottom", "")
call <sid>hi("SyntasticErrorSign", "red", "bottom", "")

" netrw
call <sid>hi("netrwMarkFile", "bottom", "green", "")
call <sid>hi("netrwTreeBar",  "low", "", "")

" Rust
call <sid>hi("rustMacro",          "yellow", "", "")
call <sid>hi("rustModPath",        "high", "", "")
call <sid>hi("rustModPathSep",     "high", "", "")
call <sid>hi("rustFuncName",       "orange", "", "")
call <sid>hi("rustFuncCall",       "orange", "", "")
call <sid>hi("rustType",           "brown", "", "")
call <sid>hi("rustKeyword",        "red", "", "")
call <sid>hi("rustConditional",    "red", "", "")
call <sid>hi("rustString",         "green", "", "")
call <sid>hi("rustDecNumber",      "blue", "", "")
call <sid>hi("rustFloat",          "blue", "", "")
call <sid>hi("rustEnumVariant",    "cyan", "", "")
call <sid>hi("rustBoolean",        "cyan", "", "")
call <sid>hi("rustIdentifier",     "high", "", "")
call <sid>hi("rustOperator",       "highest", "", "")
call <sid>hi("rustSigil",          "purple", "", "")
call <sid>hi("rustStorage",        "purple", "", "")
call <sid>hi("rustCommentLineDoc", "high", "", "")

" Taskwarrior
call <sid>hi("Taskwarrior_field", "", "", "bold")

" Since 'Normal' resets the &background, do last
let s:background = &background
call <sid>hi("Normal", "highest", "lowest", "")
let &background = s:background
unlet s:background

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui
unlet s:cterm
