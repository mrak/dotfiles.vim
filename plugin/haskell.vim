autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
function! s:add_xmonad_path()
  let l:xmonad_path = expand('~/.xmonad/lib')
  if !exists('b:ghcmod_ghc_options')
    let b:ghcmod_ghc_options = []
  endif

  call add(b:ghcmod_ghc_options, '-i' . l:xmonad_path)

  let b:syntastic_haskell_ghc_mod_exe = "ghc-mod -g -i" . l:xmonad_path . " check"
endfunction
