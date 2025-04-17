function mrak#rename#setup()
  setlocal readonly
  silent! execute 'diffthis'
  setlocal nofoldenable
  silent! execute 'normal' 'ggmRyG'
  let g:mrak#rename#original_bufnr = bufnr()
  silent! execute 'vert botright new'
  let g:mrak#rename#result_bufnr = bufnr()
  silent! execute 'normal' 'p'
  silent! execute '1d'
  silent! execute 'normal' 'ggmL'
  silent! execute 'diffthis'
  setlocal nofoldenable
endfunction

function mrak#rename#merge()
  let l:originals = getbufline(g:mrak#rename#original_bufnr, 1, '$')
  let l:targets = getbufline(g:mrak#rename#result_bufnr, 1, '$')
  let l:results = []
  let l:i = 0
  for o in l:originals
    if l:i < len(l:targets) - 1
      if l:targets[l:i] == ""
        call add(l:results, "rm	'"..o.."'")
      else
        call add(l:results, "mv	'"..o.."'	'"..l:targets[l:i].."'")
      endif
    endif
    let l:i += 1
  endfor
  silent! execute 'buffer' g:mrak#rename#original_bufnr
  silent! execute 'diffoff'
  silent! execute 'bdelete!'
  unlet g:mrak#rename#original_bufnr
  silent! execute 'buffer' g:mrak#rename#result_bufnr
  silent! execute 'diffoff'
  silent %d
  call append(0, l:results)
  silent! execute "%!column -t -s '	'"
endfunction

function mrak#rename#commit()
  silent! execute 'buffer' g:mrak#rename#result_bufnr
  execute 'w ! sh'
  unlet g:mrak#rename#result_bufnr
endfunction
