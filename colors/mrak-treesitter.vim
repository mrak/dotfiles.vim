hi clear
let g:colors_name = 'mrak-treesitter'
if &background == 'dark'
    lua require('mrak-colorscheme').setup('dark')
else
    lua require('mrak-colorscheme').setup('light')
endif
