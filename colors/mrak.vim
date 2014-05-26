" Maintainer:  Eric Mrak (mail at ericmrak dot info)
let g:colors_name = "mrak"

hi clear
syntax reset

hi CursorLine   guifg=NONE    guibg=#1c1c1c gui=NONE    ctermfg=NONE ctermbg=234  cterm=NONE
hi! link CursorLine CursorColumn
hi MatchParen   guifg=#000000 guibg=#ffffff gui=bold    ctermfg=016  ctermbg=231  cterm=bold
hi Pmenu        guifg=#dadada guibg=#444444 gui=NONE    ctermfg=253  ctermbg=238  cterm=NONE
hi PmenuSel     guifg=#444444 guibg=#AFD787 gui=NONE    ctermfg=238  ctermbg=150  cterm=NONE
hi Search       guifg=NONE    guibg=NONE    gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse

" General colors
hi Normal          guifg=#dadada guibg=#262626 gui=NONE    ctermfg=253  ctermbg=235 cterm=NONE
hi NonText         guifg=#444444 guibg=NONE    gui=NONE    ctermfg=238  ctermbg=NONE cterm=NONE

hi Cursor          guifg=NONE    guibg=#626262 gui=NONE    ctermfg=NONE ctermbg=241  cterm=NONE
hi VertSplit       guifg=#262626 guibg=#262626 gui=NONE    ctermfg=235  ctermbg=235  cterm=NONE
hi LineNr          guifg=#4e4e4e guibg=#1c1c1c gui=NONE    ctermfg=239  ctermbg=234  cterm=NONE
hi! link SignColumn LineNr
hi! link CursorColumn LineNr
hi! link CursorLineNr LineNr

hi StatusLineNor   guifg=#262626 guibg=#9e9e9e gui=bold    ctermfg=235  ctermbg=247  cterm=bold
hi StatusLineIns   guifg=#262626 guibg=#00af5f gui=bold    ctermfg=235  ctermbg=35   cterm=bold
hi StatusLineRep   guifg=#262626 guibg=#8787d7 gui=bold    ctermfg=235  ctermbg=104  cterm=bold
hi! link StatusLineVRep StatusLineRep
hi! link StatusLine StatusLineNor
hi! link StatusLineNC LineNr

hi Folded          guifg=#a8a8a8 guibg=#3a3a3a gui=NONE    ctermfg=248  ctermbg=237  cterm=NONE
hi Title           guifg=#ffffff guibg=NONE    gui=bold    ctermfg=231  ctermbg=NONE cterm=bold
hi Visual          guifg=NONE    guibg=#444444 gui=NONE    ctermfg=252  ctermbg=238  cterm=NONE
hi SpecialKey      guifg=#808080 guibg=NONE    gui=NONE    ctermfg=244  ctermbg=NONE cterm=NONE
hi Error           guifg=#df0000 guibg=NONE    gui=bold    ctermfg=160  ctermbg=NONE cterm=bold
hi! link ErrorMsg Error

" Diff tool colors
hi DiffAdd         guifg=#000000 guibg=#00af5f gui=bold    ctermfg=16   ctermbg=35   cterm=bold
hi DiffDelete      guifg=#000000 guibg=#000000 gui=bold    ctermfg=16   ctermbg=16   cterm=NONE
hi DiffChange      guifg=#000000 guibg=#af87ff gui=bold    ctermfg=16   ctermbg=141  cterm=bold
hi DiffText        guifg=#dadada guibg=#5f00df gui=bold    ctermfg=253  ctermbg=56   cterm=bold

" Syntax
hi Comment         guifg=#626262 guibg=NONE    gui=NONE    ctermfg=241  ctermbg=NONE cterm=NONE
hi String          guifg=#dfaf5f guibg=NONE    gui=NONE    ctermfg=179  ctermbg=NONE cterm=NONE
hi Number          guifg=#df5f87 guibg=NONE    gui=NONE    ctermfg=168  ctermbg=NONE cterm=NONE
hi Keyword         guifg=#87afff guibg=NONE    gui=NONE    ctermfg=111  ctermbg=NONE cterm=NONE
hi! link Conditional Keyword
hi! link Statement Keyword
hi PreProc         guifg=#AFAFDF guibg=NONE    gui=bold    ctermfg=146  ctermbg=NONE cterm=bold
hi Todo            guifg=#dfdf00 guibg=NONE    gui=italic  ctermfg=184  ctermbg=NONE cterm=NONE
hi Constant        guifg=#df5f87 guibg=NONE    gui=NONE    ctermfg=168  ctermbg=NONE cterm=NONE
hi Identifier      guifg=#AFD787 guibg=NONE    gui=NONE    ctermfg=150  ctermbg=NONE cterm=NONE
hi! link Type Identifier
hi Function        guifg=#00af5f guibg=NONE    gui=NONE    ctermfg=035  ctermbg=NONE cterm=NONE
hi Special         guifg=#af87ff guibg=NONE    gui=NONE    ctermfg=141  ctermbg=NONE cterm=NONE
hi Delimiter       guifg=#00AfAf guibg=NONE    gui=NONE    ctermfg=037  ctermbg=NONE cterm=NONE
hi! link Operator Delimeter

