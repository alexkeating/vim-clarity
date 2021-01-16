function! clarity#clarityLint#ClarLint()
  let l:contract  = expand('%:p')
  let l:cmd = '/Users/alexkeating/programming/open-source/clarity-linter/target/debug/clarity-lint' . ' --file ' . l:contract

  " Returns a dictionary from the command
  let l:resp = systemlist(l:cmd)
  call s:PlaceMarkers(l:resp, l:contract)

  " Get keys and mark lines in the gutter


endfunction

function! s:PlaceMarkers(results, file)
   echo a:results
   echo json_decode(join(a:results))
   if len(a:results) == 0
		return 
   endif
   " Just error for now
   let g:ale_sign_error = get(g:, 'ale_sign_error', '>>')
   highlight link ALEErrorSign error
   highlight link ALEErrorSignLineNr lsorLineNr
   highlight link ALEWarningSign todo
   execute ':sign define E100 text=>> texthl=ALEErrorSign'

   let l:index0 = 100
   let l:index  = l:index0
   let l:zz = json_decode(join(a:results))
   echom type(l:zz)
   let l:spans =get(l:zz, 'spans')
   " To display the error messsage I have an outcommand
   " that pulls the message from a dictionary based on the line number
   let b:clarity_lint_dict = {}
   for span in l:spans
     echo span
	 echo l:zz.message
	 echo span.start_line
	 echo index
	 echo a:file
	 let b:clarity_lint_dict[span.start_line] = l:zz.message
     execute ':sign place '.index.' name=E100'.' line='.span.start_line.' file='.a:file
     let l:index += 1
   endfor
   echo b:clarity_lint_dict
endfunction

" Add unplace markers, and add highlighting for the various levels of logging
