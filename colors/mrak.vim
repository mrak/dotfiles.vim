" Scheme: Eric Mrak (http://ericmrak.info)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak"
let s:gui = {}
let s:cterm = {}

" Greyscale
let s:gui.black      = "1c1c1c"
let s:gui.darkest    = "262626"
let s:gui.darker     = "303030"
let s:gui.dark       = "444444"
let s:gui.light      = "a8a8a8"
let s:gui.lighter    = "dadada"
let s:gui.lightest   = "e4e4e4"
let s:gui.white      = "f5f5f5"

let s:cterm.black    = "234"
let s:cterm.darkest  = "235"
let s:cterm.darker   = "236"
let s:cterm.dark     = "238"
let s:cterm.light    = "248"
let s:cterm.lighter  = "253"
let s:cterm.lightest = "254"
let s:cterm.white    = "015"

" Colors
let s:gui.red      = "df5f87"
let s:gui.orange   = "d78700"
let s:gui.yellow   = "ffd700"
let s:gui.green    = "87d75f"
let s:gui.cyan     = "00afaf"
let s:gui.blue     = "87afff"
let s:gui.purple   = "af5fff"
let s:gui.brown    = "875f00"
let s:cterm.red    = "168"
let s:cterm.orange = "172"
let s:cterm.yellow = "220"
let s:cterm.green  = "113"
let s:cterm.cyan   = "037"
let s:cterm.blue   = "111"
let s:cterm.purple = "135"
let s:cterm.brown  = "094"

" light background colors
let s:gui.redL      = "df005f"
let s:gui.orangeL   = "df5f00"
let s:gui.yellowL   = "dfaf00"
let s:gui.greenL    = "5faf5f"
let s:gui.cyanL     = "00afaf"
let s:gui.blueL     = "5f87ff"
let s:gui.purpleL   = "af5fff"
let s:gui.brownL    = "875f00"
let s:cterm.redL    = "161"
let s:cterm.orangeL = "166"
let s:cterm.yellowL = "178"
let s:cterm.greenL  = "071"
let s:cterm.cyanL   = "037"
let s:cterm.blueL   = "069"
let s:cterm.purpleL = "135"
let s:cterm.brownL  = "094"

" Highlighting function
fun <sid>hi(group, fg, bg, attr)
  let l:string = "hi " . a:group
  if a:fg == ""
    let l:string .= " guifg=NONE ctermfg=NONE"
  else
    let l:string .= " guifg=#" . s:gui_color(a:fg) . " ctermfg=" . s:cterm_color(a:fg)
  endif

  if a:bg == ""
    let l:string .= " guibg=NONE ctermbg=NONE"
  else
    let l:string .= " guibg=#" . s:gui_color(a:bg) . " ctermbg=" . s:cterm_color(a:bg)
  endif

  if a:attr == ""
    let l:string .= " gui=NONE cterm=NONE"
  else
    let l:string .= " gui=" . a:attr . " cterm=" . a:attr
  endif

  exec l:string
endfun

" Return GUI color for light/dark variants
fun s:gui_color(color)
  if &background == "dark"
    return s:gui[a:color]
  endif

  if a:color == "black"
    return s:gui.white
  elseif a:color == "darkest"
    return s:gui.lightest
  elseif a:color == "darker"
    return s:gui.lighter
  elseif a:color == "dark"
    return s:gui.light
  elseif a:color == "light"
    return s:gui.dark
  elseif a:color == "lighter"
    return s:gui.darker
  elseif a:color == "lightest"
    return s:gui.darkest
  elseif a:color == "white"
    return s:gui.black
  endif

  return s:gui[a:color . "L"]
endfun

" Return terminal color for light/dark variants
fun s:cterm_color(color)
  if &background == "dark"
    return s:cterm[a:color]
  endif

  if a:color == "black"
    return s:cterm.white
  elseif a:color == "darkest"
    return s:cterm.lightest
  elseif a:color == "darker"
    return s:cterm.lighter
  elseif a:color == "dark"
    return s:cterm.light
  elseif a:color == "light"
    return s:cterm.dark
  elseif a:color == "lighter"
    return s:cterm.darker
  elseif a:color == "lightest"
    return s:cterm.darkest
  elseif a:color == "white"
    return s:cterm.black
  endif

  return s:cterm[a:color . "L"]
endfun

" Vim editor colors
call <sid>hi("Cursor",        "black", "white", "")
call <sid>hi("CursorColumn",  "dark", "black", "none")
call <sid>hi("CursorLine",    "", "darkest", "none")
call <sid>hi("LineNr",        "dark", "black", "")
call <sid>hi("CursorLineNr",  "dark", "black", "")
call <sid>hi("VertSplit",     "black", "black", "none")
call <sid>hi("NonText",       "dark", "", "")
call <sid>hi("StatusLine",    "darkest", "light", "bold")
call <sid>hi("StatusLineNor", "darkest", "light", "bold")
call <sid>hi("StatusLineIns", "darkest", "green", "bold")
call <sid>hi("StatusLineRep", "darkest", "purple", "bold")
call <sid>hi("StatusLineVRep","darkest", "purple", "bold")
call <sid>hi("StatusLineNC",  "dark", "black", "")
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Debug",         "red", "", "")
call <sid>hi("Directory",     "blue", "", "")
call <sid>hi("Error",         "red", "", "bold")
call <sid>hi("ErrorMsg",      "red", "", "bold")
call <sid>hi("Exception",     "blue", "", "")
call <sid>hi("FoldColumn",    "", "darkest", "")
call <sid>hi("Folded",        "dark", "black", "")
call <sid>hi("IncSearch",     "darkest", "orange", "none")
call <sid>hi("Italic",        "", "", "none")
call <sid>hi("Macro",         "yellow", "", "")
call <sid>hi("MatchParen",    "darkest", "light",  "")
call <sid>hi("ModeMsg",       "green", "", "")
call <sid>hi("MoreMsg",       "green", "", "")
call <sid>hi("Question",      "yellow", "", "")
call <sid>hi("Search",        "", "",  "reverse")
call <sid>hi("TooLong",       "red", "", "")
call <sid>hi("Underlined",    "red", "", "")
call <sid>hi("Visual",        "white", "dark", "")
call <sid>hi("VisualNOS",     "red", "", "reverse")
call <sid>hi("WarningMsg",    "red", "", "")
call <sid>hi("WildMenu",      "red", "", "")
call <sid>hi("Title",         "blue", "", "none")
call <sid>hi("Conceal",       "blue", "darkest", "")
call <sid>hi("SignColumn",    "dark", "darkest", "")
call <sid>hi("SpecialKey",    "dark", "", "")
call <sid>hi("ColorColumn",   "dark", "darkest", "none")
call <sid>hi("PMenu",         "light", "dark", "none")
call <sid>hi("PMenuSel",      "darkest", "green", "")
call <sid>hi("TabLine",       "dark", "darkest", "none")
call <sid>hi("TabLineFill",   "dark", "darkest", "none")
call <sid>hi("TabLineSel",    "green", "darkest", "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      "red", "", "")
call <sid>hi("Character",    "orange", "", "")
call <sid>hi("Comment",      "dark", "", "")
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
call <sid>hi("Todo",         "yellow", "darkest", "")
call <sid>hi("Type",         "purple", "", "none")
call <sid>hi("Typedef",      "purple", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "darkest", "undercurl")
call <sid>hi("SpellLocal",   "", "darkest", "undercurl")
call <sid>hi("SpellCap",     "", "darkest", "undercurl")
call <sid>hi("SpellRare",    "", "darkest", "undercurl")

" Additional diff highlighting
call <sid>hi("DiffAdd",      "darkest", "green", "bold")
call <sid>hi("DiffChange",   "darkest", "purple", "bold")
call <sid>hi("DiffDelete",   "darkest", "", "")
call <sid>hi("DiffText",     "darkest", "purple", "bold")
call <sid>hi("DiffAdded",    "green", "", "")
call <sid>hi("DiffFile",     "cyan", "", "")
call <sid>hi("DiffNewFile",  "cyan", "", "bold")
call <sid>hi("DiffLine",     "blue", "", "")
call <sid>hi("DiffRemoved",  "red", "", "")
call <sid>hi("DiffSubname",  "light", "", "")

" Ruby highlighting
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
call <sid>hi("rubySharpBang",               "dark", "", "")
call <sid>hi("rubyControl",                 "blue", "", "")
call <sid>hi("rubyExceptional",             "blue", "", "")
call <sid>hi("rubyFunction",                "yellow", "", "")

" PHP highlighting
call <sid>hi("phpVarSelector",     "cyan", "", "")
call <sid>hi("phpMemberSelector",  "lighter", "", "")
call <sid>hi("phpComparison",      "lighter", "", "")
call <sid>hi("phpParent",          "lighter", "", "")
call <sid>hi("phpRegion",          "lighter", "", "")
call <sid>hi("phpStringSingle",    "orange", "", "")
call <sid>hi("phpType",            "yellow", "", "")
call <sid>hi("phpDefine",          "blue", "", "")
call <sid>hi("phpInclude",         "red", "", "")

" HTML highlighting
call <sid>hi("htmlBold",           "yellow", "", "")
call <sid>hi("htmlItalic",         "purple", "", "")
call <sid>hi("htmlEndTag",         "lighter", "", "")
call <sid>hi("htmlTag",            "lighter", "", "")
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


" CSS highlighting
call <sid>hi("cssBraces",      "lighter", "", "")
call <sid>hi("cssClassName",   "purple", "", "")
call <sid>hi("cssColor",       "cyan", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     "red", "", "")
call <sid>hi("sassClassChar",  "orange", "", "")
call <sid>hi("sassInclude",    "purple", "", "")
call <sid>hi("sassMixing",     "purple", "", "")
call <sid>hi("sassMixinName",  "blue", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",            "lighter", "", "")
call <sid>hi("javaScriptNumber",      "red", "", "")
call <sid>hi("javaScriptFuncArg",     "cyan", "", "bold")
call <sid>hi("javaScriptFuncKeyword", "yellow", "", "")
call <sid>hi("javaScriptFuncDef",     "cyan", "", "")
call <sid>hi("javaScriptParens",      "", "", "bold")
call <sid>hi("javaScriptBraces",      "cyan", "", "")
call <sid>hi("javaScriptEndColons",   "", "", "")
call <sid>hi("javaScriptBoolean",     "purple", "", "")

" Python
call <sid>hi("pythonInclude",   "red", "", "")
call <sid>hi("pythonStatement", "green", "", "")
call <sid>hi("pythonFunction",  "cyan", "", "")
call <sid>hi("pythonBuiltin",   "blue", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",             "cyan", "", "")
call <sid>hi("markdownCodeBlock",        "cyan", "", "")
call <sid>hi("markdownHeadingDelimiter", "purple", "", "bold")
call <sid>hi("markdownItalic",           "green", "", "italic")
call <sid>hi("markdownBold",             "green", "", "bold")

" Git highlighting
call <sid>hi("gitcommitOverflow", "red", "", "")
call <sid>hi("gitcommitSummary",  "lightest", "", "")
call <sid>hi("gitcommitFirstLine",  "", "", "")
call <sid>hi("gitcommitHeader",   "blue", "", "")
call <sid>hi("gitcommitBranch",   "cyan", "", "")
call <sid>hi("gitcommitSelectedFile",   "orange", "", "")
call <sid>hi("gitcommitSelectedType",   "yellow", "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",          "green", "darkest", "")
call <sid>hi("GitGutterChange",       "blue", "darkest", "")
call <sid>hi("GitGutterDelete",       "red", "darkest", "")
call <sid>hi("GitGutterChangeDelete", "purple", "darkest", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",    "green", "darkest", "")
call <sid>hi("SignifySignChange", "blue", "darkest", "")
call <sid>hi("SignifySignDelete", "red", "darkest", "")

" Shell highlighting
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

" VimL hightlighting
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

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash", "blue", "", "")
call <sid>hi("NERDTreeExecFile", "lighter", "", "")

" CtrlP
call <sid>hi("CtrlPMatch", "red", "", "underline")
call <sid>hi("CtrlPMode1", "blue", "darkest", "bold")
call <sid>hi("CtrlPMode2", "dark", "light", "bold")

" Syntastic
call <sid>hi("SyntasticWarningSign", "yellow", "black", "")
call <sid>hi("SyntasticErrorSign", "red", "black", "")

" netrw
call <sid>hi("netrwMarkFile", "black", "green", "")
call <sid>hi("netrwTreeBar",  "dark", "", "")

" Since 'Normal' resets the &background, do last
let s:background = &background
call <sid>hi("Normal", "lightest", "darkest", "")
let &background = s:background
unlet s:background

" Remove functions
delf <sid>hi
delf <sid>gui_color
delf <sid>cterm_color

" Remove color variables
unlet s:gui
unlet s:cterm
