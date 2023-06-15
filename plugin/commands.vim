" Use :SudoWrite from vim-eunuch instead
"command! Sudo %!sudo tee > /dev/null %
command! Cd cd %:h
command! -nargs=* TabTitle call mrak#tabtitle#set(<f-args>)
