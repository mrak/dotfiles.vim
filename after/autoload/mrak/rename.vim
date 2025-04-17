function mrak#rename#fn()
  if !exists("g:mrak#rename#original_bufnr") && !exists("g:mrak#rename#result_bufnr")
    call mrak#rename#setup()
  elseif exists("g:mrak#rename#original_bufnr") && exists("g:mrak#rename#result_bufnr")
    call mrak#rename#merge()
  else
    call mrak#rename#commit()
  endif
endfunction

function mrak#rename#setup()
  setlocal readonly
  silent! execute 'file' 'before'
  silent! execute 'diffthis'
  setlocal nofoldenable
  silent! execute 'normal' 'ggmRyG'
  let g:mrak#rename#original_bufnr = bufnr()
  silent! execute 'vert botright new'
  setlocal readonly
  silent! execute 'file' 'after'
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
  if len(l:originals) != len(l:targets)
    echom "Must have same number of lines in each buffer"
    return
  endif
  let l:results = []
  let l:i = 0
  let l:new_directories = {}
  for o in l:originals
    if l:targets[l:i] == ""
      call add(l:results, "rm	'"..o.."'	# deleted")
    elseif l:targets[l:i] !=# o
      let l:target_dir = fnamemodify(l:targets[l:i], ':h')
      if !isdirectory(l:target_dir) && !has_key(l:new_directories, l:target_dir)
        let l:new_directories[l:target_dir] = v:null
        call add(l:results, "mkdir -p	 	'"..l:target_dir.."'")
      endif
      unlet l:target_dir
      call add(l:results, "mv	'"..o.."'	'"..l:targets[l:i].."'")
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
  setlocal filetype=sh
  call append(0, l:results)
  silent! execute "%!column -t -s '	'"
endfunction

function mrak#rename#commit()
  silent! execute 'buffer' g:mrak#rename#result_bufnr
  execute 'w ! sh'
  unlet g:mrak#rename#result_bufnr
  silent! execute 'bdelete!'
endfunction
