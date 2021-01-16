" Get global dict and find line and print error
function! clarity#cursor#EchoCursorMessage()
  " Only echo the warnings in normal mode, otherwise we will get problems.
  if mode() isnot# 'n'
      return
  endif

  " This seems dangerous and does not play well with other tools
  echo ''
  let l:msg = get(b:clarity_lint_dict, line('.'), '')
  if l:msg !=# ''
    echo l:msg
  endif 
endfunction



