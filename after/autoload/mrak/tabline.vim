function! mrak#tabline#main()
  let s = '%#TabLineProg# ' .. v:progname .. ' '
  for i in range(tabpagenr('$'))
    let tn = i + 1
    " set the tab page number (for mouse clicks)
    let s ..= '%' .. tn .. 'T'

    " select the highlighting
    if tn == tabpagenr()
      let s ..= '%#TabLineNumSel# ' .. tn .. ' %#TabLineSel#'
    else
      let s ..= '%#TabLineNum# ' .. tn .. ' %#TabLine#'
    endif


    " the label is made by MyTabLabel()
    let s ..= ' %{mrak#tabline#tab(' .. tn .. ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s ..= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s ..= '%=%#TabLine#'
  endif

  return s
endfunction

function! s:partsmap(n, i, p)
  if a:i + 1 == a:n | return a:p     | endif
  if a:p[0] == '.'  | return a:p[:1] | endif
  return a:p[0]
endfunction

function! mrak#tabline#tab(n)
  let l:title = gettabvar(a:n, 'tabtitle','')
  if l:title isnot '' | return l:title | endif

  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let l:title = bufname(buflist[winnr - 1])
  if l:title is '' | return '[No Name]' | endif

  let l:parts = split(l:title, '/', 1)
  return l:parts->map(function('s:partsmap', [len(l:parts)]))->join('/')
endfunction
