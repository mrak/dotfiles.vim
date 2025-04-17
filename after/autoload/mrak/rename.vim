function mrak#rename#fn()
  setlocal readonly
  execute 'file' 'original'
  execute 'diffthis'
  setlocal nofoldenable
  execute 'normal' 'ggyG'
  execute 'vert botright new'
  execute 'file' 'result'
  setlocal readonly
  execute 'normal' 'p'
  execute '1d'
  execute 'diffthis'
  setlocal nofoldenable
endfunction

function mrak#rename#test()
  exec 'echo' '"yo"'
endfunction
