" Scheme: Eric Mrak (http://ericmrak.info)
" Based off of Base16 (https://github.com/chriskempson/base16)
hi clear
syntax reset
let g:colors_name = "mrak16"

" GUI color definitions
let s:gui = {}
let s:gui.black    = "1c1c1c"
let s:gui.darkest  = "262626"
let s:gui.darker   = "303030"
let s:gui.dark     = "444444"
let s:gui.light    = "d0d0d0"
let s:gui.lighter  = "e4e4e4"
let s:gui.lightest = "eeeeee"
let s:gui.white    = "ffffff"

let s:gui.red         = "df5f87"
let s:gui.orange      = "dfaf5f"
let s:gui.yellow      = "dfdf00"
let s:gui.green       = "afd787"
let s:gui.cyan        = "00afaf"
let s:gui.blue        = "87afff"
let s:gui.purple      = "afafdf"
let s:gui.brown       = "875f00"
"let s:gui.brightgreen = "00af5f"

" Terminal color definitions
let s:cterm = {}
let s:cterm.black    = "234"
let s:cterm.darkest  = "235"
let s:cterm.darker   = "236"
let s:cterm.dark     = "238"
let s:cterm.light    = "252"
let s:cterm.lighter  = "254"
let s:cterm.lightest = "255"
let s:cterm.white    = "015"

let s:cterm.red         = "168"
let s:cterm.orange      = "179"
let s:cterm.yellow      = "184"
let s:cterm.green       = "150"
let s:cterm.cyan        = "037"
let s:cterm.blue        = "111"
let s:cterm.purple      = "146"
let s:cterm.brown       = "094"
"let s:cterm.brightgreen = "035"

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
call <sid>hi("Cursor",        "", "", "reverse")
call <sid>hi("CursorColumn",  "dark", "black", "none")
call <sid>hi("CursorLine",    "", "darkest", "none")
call <sid>hi("LineNr",        "dark", "black", "")
call <sid>hi("CursorLineNr",  "dark", "black", "")
call <sid>hi("VertSplit",     "darkest", "darkest", "none")
call <sid>hi("NonText",       "dark", "", "")
call <sid>hi("StatusLine",    "darkest", "light", "bold")
call <sid>hi("StatusLineNC",  "dark", "black", "none")
call <sid>hi("StatusLineNor", "darkest", "light", "bold")
call <sid>hi("StatusLineIns", "darkest", "green", "bold")
call <sid>hi("StatusLineRep", "darkest", "purple", "bold")
call <sid>hi("StatusLineVRep","darkest", "purple", "bold")
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
call <sid>hi("MatchParen",    "darkest", "dark",  "")
call <sid>hi("ModeMsg",       "green", "", "")
call <sid>hi("MoreMsg",       "green", "", "")
call <sid>hi("Question",      "yellow", "", "")
call <sid>hi("Search",        "", "",  "reverse")
call <sid>hi("SpecialKey",    "dark", "", "")
call <sid>hi("TooLong",       "red", "", "")
call <sid>hi("Underlined",    "red", "", "")
call <sid>hi("Visual",        "", "", "reverse")
call <sid>hi("VisualNOS",     "red", "", "reverse")
call <sid>hi("WarningMsg",    "red", "", "")
call <sid>hi("WildMenu",      "red", "", "")
call <sid>hi("Title",         "blue", "", "none")
call <sid>hi("Conceal",       "blue", "darkest", "")
call <sid>hi("SignColumn",    "dark", "black", "")
call <sid>hi("SpecialKey",    "dark", "", "")
call <sid>hi("ColorColumn",   "dark", "darkest", "none")
call <sid>hi("PMenu",         "light", "black", "none")
call <sid>hi("PMenuSel",      "darkest", "green", "")
call <sid>hi("TabLine",       "dark", "darkest", "none")
call <sid>hi("TabLineFill",   "dark", "darkest", "none")
call <sid>hi("TabLineSel",    "green", "darkest", "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      "red", "", "")
call <sid>hi("Character",    "red", "", "")
call <sid>hi("Comment",      "dark", "", "")
call <sid>hi("Conditional",  "blue", "", "")
call <sid>hi("Constant",     "red", "", "")
call <sid>hi("Define",       "yellow", "", "none")
call <sid>hi("Delimiter",    "cyan", "", "")
call <sid>hi("Float",        "orange", "", "")
call <sid>hi("Function",     "green", "", "")
call <sid>hi("Identifier",   "green", "", "none")
call <sid>hi("Include",      "blue", "", "")
call <sid>hi("Keyword",      "blue", "", "")
call <sid>hi("Label",        "yellow", "", "")
call <sid>hi("Number",       "red", "", "")
call <sid>hi("Operator",     "cyan", "", "none")
call <sid>hi("PreProc",      "purple", "", "bold")
call <sid>hi("Repeat",       "yellow", "", "")
call <sid>hi("Special",      "purple", "", "")
call <sid>hi("SpecialChar",  "purple", "", "")
call <sid>hi("Statement",    "blue", "", "")
call <sid>hi("StorageClass", "yellow", "", "")
call <sid>hi("String",       "orange", "", "")
call <sid>hi("Structure",    "purple", "", "")
call <sid>hi("Tag",          "yellow", "", "")
call <sid>hi("Todo",         "yellow", "darkest", "")
call <sid>hi("Type",         "green", "", "none")
call <sid>hi("Typedef",      "yellow", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "darkest", "undercurl")
call <sid>hi("SpellLocal",   "", "darkest", "undercurl")
call <sid>hi("SpellCap",     "", "darkest", "undercurl")
call <sid>hi("SpellRare",    "", "darkest", "undercurl")

" Additional diff highlighting
call <sid>hi("DiffAdd",      "darkest", "green", "bold")
call <sid>hi("DiffChange",   "darkest", "purple", "bold")
call <sid>hi("DiffDelete",   "darkest", "darkest", "")
call <sid>hi("DiffText",     "darkest", "purple", "bold")
call <sid>hi("DiffAdded",    "green", "darkest", "")
call <sid>hi("DiffFile",     "red", "darkest", "")
call <sid>hi("DiffNewFile",  "green", "darkest", "")
call <sid>hi("DiffLine",     "blue", "darkest", "")
call <sid>hi("DiffRemoved",  "red", "darkest", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               "blue", "", "")
call <sid>hi("rubyConstant",                "yellow", "", "")
call <sid>hi("rubyInterpolation",           "green", "", "")
call <sid>hi("rubyInterpolationDelimiter",  "purple", "", "")
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

" Since 'Normal' resets the &background, do last
let s:background = &background
call <sid>hi("Normal",        "lightest", "darkest", "")
let &background = s:background
unlet s:background

" Remove functions
delf <sid>hi
delf <sid>gui_color
delf <sid>cterm_color

" Remove color variables
unlet s:gui
unlet s:cterm
