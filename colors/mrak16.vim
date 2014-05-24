" Scheme: Eric Mrak (http://ericmrak.info)
" Based off of Base16 (https://github.com/chriskempson/base16)
let g:colors_name = "base16-default"

hi clear
syntax reset

" GUI color definitions
let s:gui = {}
let s:gui.black    = "121212"
let s:gui.darkest  = "1c1c1c"
let s:gui.darker   = "272521"
let s:gui.dark     = "444444"
let s:gui.light    = "767676"
let s:gui.lighter  = "a8a8a8"
let s:gui.lightest = "bcbcbc"
let s:gui.white    = "eeeeee"

let s:gui.red    = "df5f87"
let s:gui.orange = "dfaf5f"
let s:gui.yellow = "dfdf00"
let s:gui.green  = "00af5f"
let s:gui.cyan   = "00afaf"
let s:gui.blue   = "87afff"
let s:gui.purple = "afafdf"
let s:gui.brown  = "875f00"

" Terminal color definitions
let s:cterm = {}
let s:cterm.black    = "233"
let s:cterm.darkest  = "234"
let s:cterm.darker   = "NONE"
let s:cterm.dark     = "238"
let s:cterm.light    = "243"
let s:cterm.lighter  = "248"
let s:cterm.lightest = "250"
let s:cterm.white    = "255"

let s:cterm.red    = "168"
let s:cterm.orange = "179"
let s:cterm.yellow = "184"
let s:cterm.green  = "35"
let s:cterm.cyan   = "037"
let s:cterm.blue   = "111"
let s:cterm.purple = "146"
let s:cterm.brown  = "94"

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

  return s:gui[a:color]
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

  return s:cterm[a:color]
endfun

" Vim editor colors
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Debug",         "red", "", "")
call <sid>hi("Directory",     "blue", "", "")
call <sid>hi("Error",         "red", "", "bold")
call <sid>hi("ErrorMsg",      "red", "", "bold")
call <sid>hi("Exception",     "red", "", "")
call <sid>hi("FoldColumn",    "", "darkest", "")
call <sid>hi("Folded",        "dark", "darkest", "")
call <sid>hi("IncSearch",     "darkest", "orange", "none")
call <sid>hi("Italic",        "", "", "none")
call <sid>hi("Macro",         "red", "", "")
call <sid>hi("MatchParen",    "black", "dark",  "")
call <sid>hi("ModeMsg",       "green", "", "")
call <sid>hi("MoreMsg",       "green", "", "")
call <sid>hi("Question",      "yellow", "", "")
call <sid>hi("Search",        "", "",  "reverse")
call <sid>hi("SpecialKey",    "dark", "", "")
call <sid>hi("TooLong",       "red", "", "")
call <sid>hi("Underlined",    "red", "", "")
call <sid>hi("Visual",        "", "darker", "")
call <sid>hi("VisualNOS",     "red", "", "")
call <sid>hi("WarningMsg",    "red", "", "")
call <sid>hi("WildMenu",      "red", "", "")
call <sid>hi("Title",         "blue", "", "none")
call <sid>hi("Conceal",       "blue", "black", "")
call <sid>hi("Cursor",        "", "light", "")
call <sid>hi("NonText",       "dark", "", "")
call <sid>hi("Normal",        "lightest", "darker", "")
call <sid>hi("LineNr",        "dark", "darkest", "")
call <sid>hi("SignColumn",    "dark", "darkest", "")
call <sid>hi("SpecialKey",    "dark", "", "")
call <sid>hi("StatusLine",    "light", "darker", "bold")
call <sid>hi("StatusLineNC",  "dark", "darkest", "none")
call <sid>hi("StatusLineNor", "darker", "lighter", "bold")
call <sid>hi("StatusLineIns", "darker", "green", "bold")
call <sid>hi("StatusLineRep", "darker", "purple", "bold")
call <sid>hi("StatusLineVRep","darker", "purple", "bold")
call <sid>hi("VertSplit",     "darker", "darker", "none")
call <sid>hi("ColorColumn",   "dark", "darkest", "none")
call <sid>hi("CursorColumn",  "dark", "darkest", "none")
call <sid>hi("CursorLine",    "", "darkest", "none")
call <sid>hi("CursorLineNr",  "dark", "darkest", "")
call <sid>hi("PMenu",         "light", "darkest", "none")
call <sid>hi("PMenuSel",      "darkest", "green", "")
call <sid>hi("TabLine",       "dark", "darkest", "none")
call <sid>hi("TabLineFill",   "dark", "darkest", "none")
call <sid>hi("TabLineSel",    "green", "darkest", "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      "orange", "", "")
call <sid>hi("Character",    "red", "", "")
call <sid>hi("Comment",      "dark", "", "")
call <sid>hi("Conditional",  "blue", "", "")
call <sid>hi("Constant",     "red", "", "")
call <sid>hi("Define",       "brown", "", "none")
call <sid>hi("Delimiter",    "cyan", "", "")
call <sid>hi("Float",        "orange", "", "")
call <sid>hi("Function",     "cyan", "", "")
call <sid>hi("Identifier",   "green", "", "none")
call <sid>hi("Include",      "blue", "", "")
call <sid>hi("Keyword",      "blue", "", "")
call <sid>hi("Label",        "yellow", "", "")
call <sid>hi("Number",       "red", "", "")
call <sid>hi("Operator",     "cyan", "", "none")
call <sid>hi("PreProc",      "brown", "", "bold")
call <sid>hi("Repeat",       "yellow", "", "")
call <sid>hi("Special",      "purple", "", "")
call <sid>hi("SpecialChar",  "purple", "", "")
call <sid>hi("Statement",    "blue", "", "")
call <sid>hi("StorageClass", "yellow", "", "")
call <sid>hi("String",       "orange", "", "")
call <sid>hi("Structure",    "purple", "", "")
call <sid>hi("Tag",          "yellow", "", "")
call <sid>hi("Todo",         "yellow", "darkest", "")
call <sid>hi("Type",         "cyan", "", "none")
call <sid>hi("Typedef",      "yellow", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "black", "undercurl")
call <sid>hi("SpellLocal",   "", "black", "undercurl")
call <sid>hi("SpellCap",     "", "black", "undercurl")
call <sid>hi("SpellRare",    "", "black", "undercurl")

" Additional diff highlighting
call <sid>hi("DiffAdd",      "black", "green", "bold")
call <sid>hi("DiffChange",   "black", "purple", "bold")
call <sid>hi("DiffDelete",   "black", "black", "")
call <sid>hi("DiffText",     "black", "purple", "bold")
call <sid>hi("DiffAdded",    "green", "black", "")
call <sid>hi("DiffFile",     "red", "black", "")
call <sid>hi("DiffNewFile",  "green", "black", "")
call <sid>hi("DiffLine",     "blue", "black", "")
call <sid>hi("DiffRemoved",  "red", "black", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               "blue", "", "")
call <sid>hi("rubyConstant",                "yellow", "", "")
call <sid>hi("rubyInterpolation",           "green", "", "")
call <sid>hi("rubyInterpolationDelimiter",  "brown", "", "")
call <sid>hi("rubyRegexp",                  "cyan", "", "")
call <sid>hi("rubySymbol",                  "green", "", "")
call <sid>hi("rubyStringDelimiter",         "green", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  "lighter", "", "")
call <sid>hi("phpComparison",      "lighter", "", "")
call <sid>hi("phpParent",          "lighter", "", "")

" HTML highlighting
call <sid>hi("htmlBold",    "yellow", "", "")
call <sid>hi("htmlItalic",  "purple", "", "")
call <sid>hi("htmlEndTag",  "lighter", "", "")
call <sid>hi("htmlTag",     "lighter", "", "")

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
call <sid>hi("javaScript",        "lighter", "", "")
call <sid>hi("javaScriptBraces",  "lighter", "", "")
call <sid>hi("javaScriptNumber",  "orange", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              "cyan", "", "")
call <sid>hi("markdownCodeBlock",         "cyan", "", "")
call <sid>hi("markdownHeadingDelimiter",  "purple", "", "bold")

" Git highlighting
call <sid>hi("gitCommitOverflow",  "red", "", "")
call <sid>hi("gitCommitSummary",   "green", "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     "green", "darkest", "")
call <sid>hi("GitGutterChange",  "blue", "darkest", "")
call <sid>hi("GitGutterDelete",  "red", "darkest", "")
call <sid>hi("GitGutterChangeDelete",  "purple", "darkest", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     "green", "darkest", "")
call <sid>hi("SignifySignChange",  "blue", "darkest", "")
call <sid>hi("SignifySignDelete",  "red", "darkest", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  "blue", "", "")
call <sid>hi("NERDTreeExecFile",  "lighter", "", "")

" Remove functions
delf <sid>hi
delf <sid>gui_color
delf <sid>cterm_color

" Remove color variables
unlet s:gui
unlet s:cterm
