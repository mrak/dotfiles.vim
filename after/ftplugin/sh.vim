if executable('shellcheck')
  compiler shellcheck
  setlocal makeprg=shellcheck\ -f\ gcc\ %:p
endif
