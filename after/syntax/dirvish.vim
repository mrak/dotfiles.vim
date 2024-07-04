syntax clear DirvishExe
syntax clear DirvishLink
for s:l in split(globpath(expand('%:p'), '*'), '\n')
  if getftype(s:l) ==# 'link'
    exe 'syntax match DirvishLink ,'.s:l.'$, contains=DirvishPathHead'
  elseif executable(s:l) && !isdirectory(s:l)
    exe 'syntax match DirvishExe ,'.escape(s:l,'[,*.^$~\').'$, contains=DirvishPathHead'
  endif
endfor
