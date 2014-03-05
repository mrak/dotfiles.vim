" Maintainer:  Eric Mrak (mail at ericmrak dot info)
" Last Change: June 11 2012

set background=dark

hi clear

if exists("syntax_on")
   syntax reset
endif

let colors_name = "mrak"

" Vim >= 7.0 specific colors
if version >= 700
   hi CursorLine   guifg=NONE    guibg=#000000 gui=NONE    ctermfg=NONE ctermbg=016  cterm=NONE
   hi CursorColumn guifg=NONE    guibg=#303030 gui=NONE    ctermfg=NONE ctermbg=236  cterm=NONE
   hi MatchParen   guifg=#000000 guibg=#ffffff gui=bold    ctermfg=016  ctermbg=231  cterm=bold
   hi Pmenu        guifg=#dadada guibg=#444444 gui=NONE    ctermfg=253  ctermbg=238  cterm=NONE
   hi PmenuSel     guifg=#444444 guibg=#AFD787 gui=NONE    ctermfg=238  ctermbg=150  cterm=NONE
   hi Search       guifg=NONE    guibg=NONE    gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
endif

" General colors
"hi Normal          guifg=#dadada guibg=#272521 gui=NONE    ctermfg=253  ctermbg=235  cterm=NONE
hi Normal          guifg=#dadada guibg=#272521 gui=NONE    ctermfg=253  ctermbg=NONE cterm=NONE
hi NonText         guifg=#444444 guibg=NONE    gui=NONE    ctermfg=238  ctermbg=NONE cterm=NONE

hi Cursor          guifg=NONE    guibg=#626262 gui=NONE    ctermfg=NONE ctermbg=241  cterm=NONE
hi LineNr          guifg=#626262 guibg=#000000 gui=NONE    ctermfg=241  ctermbg=016  cterm=NONE
hi SignColumn      guifg=#626262 guibg=#000000 gui=NONE    ctermfg=241  ctermbg=016  cterm=NONE
hi ColorColumn     guifg=#626262 guibg=#000000 gui=NONE    ctermfg=241  ctermbg=016  cterm=NONE
hi VertSplit       guifg=#444444 guibg=#444444 gui=NONE    ctermfg=234  ctermbg=238  cterm=NONE

hi StatusLine      guifg=#9e9e9e guibg=#444444 gui=NONE    ctermfg=247  ctermbg=238  cterm=NONE
hi StatusLineNC    guifg=#9e9e9e guibg=#444444 gui=NONE    ctermfg=252  ctermbg=238  cterm=NONE
hi User1           guifg=#262626 guibg=#9e9e9e gui=NONE    ctermfg=235  ctermbg=247  cterm=NONE
hi User2           guifg=#262626 guibg=#6c6c6c gui=NONE    ctermfg=235  ctermbg=242  cterm=NONE
hi User3           guifg=#9e9e9e guibg=#444444 gui=NONE    ctermfg=247  ctermbg=238  cterm=NONE

hi Folded          guifg=#a8a8a8 guibg=#3a3a3a gui=NONE    ctermfg=248  ctermbg=237  cterm=NONE
hi Title           guifg=#ffffff guibg=NONE    gui=bold    ctermfg=231  ctermbg=NONE cterm=bold
hi Visual          guifg=NONE    guibg=#444444 gui=NONE    ctermfg=252  ctermbg=238  cterm=NONE
hi Error           guifg=#df0000 guibg=NONE    gui=bold    ctermfg=160  ctermbg=NONE cterm=bold
hi ErrorMsg        guifg=#df0000 guibg=NONE    gui=bold    ctermfg=160  ctermbg=NONE cterm=bold

hi SpecialKey      guifg=#808080 guibg=NONE    gui=NONE    ctermfg=244  ctermbg=NONE cterm=NONE

" Diff tool colors
hi DiffAdd         guifg=#000000 guibg=#00af5f gui=bold    ctermfg=16   ctermbg=35   cterm=bold
hi DiffDelete      guifg=#000000 guibg=#000000 gui=bold    ctermfg=16   ctermbg=16   cterm=NONE
hi DiffChange      guifg=#000000 guibg=#af87ff gui=bold    ctermfg=16   ctermbg=141  cterm=bold
hi DiffText        guifg=#dadada guibg=#5f00df gui=bold    ctermfg=253  ctermbg=56   cterm=bold

" Syntax
hi Comment         guifg=#949494 guibg=NONE    gui=italic  ctermfg=246  ctermbg=NONE cterm=NONE
hi String          guifg=#dfaf5f guibg=NONE    gui=NONE    ctermfg=179  ctermbg=NONE cterm=NONE
hi Number          guifg=#df5f87 guibg=NONE    gui=NONE    ctermfg=168  ctermbg=NONE cterm=NONE

hi Keyword         guifg=#87afff guibg=NONE    gui=NONE    ctermfg=111  ctermbg=NONE cterm=NONE
hi PreProc         guifg=#AFAFDF guibg=NONE    gui=bold    ctermfg=146  ctermbg=NONE cterm=bold
hi Conditional     guifg=#87afff guibg=NONE    gui=NONE    ctermfg=111  ctermbg=NONE cterm=NONE

hi Todo            guifg=#dfdf00 guibg=NONE    gui=italic  ctermfg=184  ctermbg=NONE cterm=NONE
hi Constant        guifg=#df5f87 guibg=NONE    gui=NONE    ctermfg=168  ctermbg=NONE cterm=NONE

hi Identifier      guifg=#AFD787 guibg=NONE    gui=NONE    ctermfg=150  ctermbg=NONE cterm=NONE
hi Function        guifg=#00af5f guibg=NONE    gui=NONE    ctermfg=035  ctermbg=NONE cterm=NONE
hi Type            guifg=#AFD787 guibg=NONE    gui=NONE    ctermfg=150  ctermbg=NONE cterm=NONE
hi Statement       guifg=#87afff guibg=NONE    gui=NONE    ctermfg=111  ctermbg=NONE cterm=NONE

hi Special         guifg=#af87ff guibg=NONE    gui=NONE    ctermfg=141  ctermbg=NONE cterm=NONE
hi Delimiter       guifg=#00AfAf guibg=NONE    gui=NONE    ctermfg=037  ctermbg=NONE cterm=NONE
hi Operator        guifg=#00AfAf guibg=NONE    gui=NONE    ctermfg=037  ctermbg=NONE cterm=NONE
