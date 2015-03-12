if has("gui_running")
    set lines=40 columns=100
    set guioptions=ega
    " e = gui tabs
    " g = gray-out unusable menu items
    " a = add selections to * register
    set mousefocus " window focus follows mouse
    set guifont=Source\ Code\ Pro\ 10
    hi Normal guifg=#CCCCCC guibg=#262626

    if has("unix")
        let s:uname = system("uname")
        " Mac only
        if s:uname == "Darwin\n"
            inoremap <A-BS> <C-w>
            inoremap <A-Del> <C-o>dw
        else
            inoremap <C-BS> <C-w>
            inoremap <C-Del> <C-o>dw
        endif
    endif

    if has("gui_gtk2")
        nnoremap ½ <ESC>:call mrak#Zoom(1)<CR>
        nnoremap ­ <ESC>:call mrak#Zoom(-1)<CR>
        nnoremap ° <ESC>:set guifont=Source\ Code\ Pro\ 10<CR>
    endif
endif
