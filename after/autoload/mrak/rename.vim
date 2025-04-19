function mrak#rename#fn()
    call mrak#rename#setup()
endfunction

function mrak#rename#setup()
  let g:mrak#rename#before_winnr = winnr()
  setlocal readonly
  silent! execute 'file' 'mrak:///before'
  silent! execute 'diffthis'
  setlocal nofoldenable
  silent! execute 'normal' 'ggyG'

  silent! execute 'vertical botright new'
  let g:mrak#rename#after_winnr = winnr()
  setlocal readonly
  silent! execute 'file' 'mrak:///after'
  silent! execute 'normal' 'p'
  silent! execute '1d'
  silent! execute 'diffthis'
  setlocal nofoldenable

  silent! execute 'horizontal botright new'
  let g:mrak#rename#commands_winnr = winnr()
  setlocal readonly
  silent! execute 'file' 'mrak:///commands'
  setlocal filetype=sh

  silent execute g:mrak#rename#after_winnr..'wincmd w'
  autocmd! DiffUpdated <buffer> call mrak#rename#commands()
endfunction

function mrak#rename#commands()
  let l:originals = getbufline(winbufnr(g:mrak#rename#before_winnr), 1, '$')
  let l:targets = getbufline(winbufnr(g:mrak#rename#after_winnr), 1, '$')
  if len(l:originals) != len(l:targets)
    echom "Must have same number of lines in each buffer"
    return
  endif
  let l:results = []
  let l:i = 0
  let l:new_directories = {}
  for o in l:originals
    if l:targets[l:i] == ""
      call add(l:results, "rm'"..o.."'# deleted")
    elseif l:targets[l:i] !=# o
      let l:target_dir = fnamemodify(l:targets[l:i], ':h')
      if !isdirectory(l:target_dir) && !has_key(l:new_directories, l:target_dir)
        let l:new_directories[l:target_dir] = v:null
        call add(l:results, "mkdir -p '"..l:target_dir.."'")
      endif
      unlet l:target_dir
      call add(l:results, "mv'"..o.."''"..l:targets[l:i].."'")
    endif
    let l:i += 1
  endfor
  silent execute g:mrak#rename#commands_winnr..'wincmd w'
  silent %d _
  call append(0, l:results)
  silent! execute "%!column -t -s ''"
  silent execute g:mrak#rename#after_winnr..'wincmd w'
endfunction
