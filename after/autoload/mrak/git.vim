" If fugitive is already open in a tab, focus it.
" Otherwise, open fugituve in a new tab and name it.
function! mrak#git#openfugitive()
  if mrak#tabtitle#get() == 'git'
    return
  endif
  for i in range(tabpagenr('$'))
    if gettabvar(i, 'tabtitle', '') == 'git'
      silent exec 'normal' i .. 'gt'
      return
    endif
  endfor
  silent exec 'tab Git'
  silent exec 'TabTitle git'
endfunction
