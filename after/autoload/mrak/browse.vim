function! mrak#browse#fn(url)
  if has('mac')
    silent execute '!open' a:url
  elseif has('linux')
    silent execute '!xdg-open' a:url
  elseif has('windows')
    silent execute '!start' a:url
  endif
endfunction
