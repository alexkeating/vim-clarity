let g:clarity_lint_sign_error = get(g:, 'clarity_lint_sign_error', '>>')
let g:clarity_lint_sign_warning = get(g:, 'clarity_lint_sign_warning', '--')
let g:clarity_lint_sign_info = get(g:, 'clarity_lint_sign_info', g:clarity_lint_sign_warning)

if !hlexists('ClarityErrorSign')
    highlight link ClarityErrorSign error
endif

if !hlexists('ClarityWarningSign')
    highlight link ClarityWarningSign todo
endif

if !hlexists('ClarityInfoSign')
    highlight link ClarityInfoSign ClarityWarningSign
endif


" Spaces and backslashes need to be escaped for signs.
function! s:EscapeSignText(sign_text) abort
    return substitute(substitute(a:sign_text, ' *$', '', ''), '\\\| ', '\\\0', 'g')
endfunction


" It is an assumption the linter is Error, Warning, Info
execute 'sign define ClarityErrorSign text=' . s:EscapeSignText(g:clarity_lint_sign_error)
\   . ' texthl=ClarityErrorSign'
execute 'sign define ClarityWarningSign text=' . s:EscapeSignText(g:clarity_lint_sign_warning)
\   . ' texthl=ClarityWarningSign'
execute 'sign define ClarityInfoSign text=' . s:EscapeSignText(g:clarity_lint_sign_info)
\   . ' texthl=ClarityInfoSign'



function! clarity#clarityLint#ClarLint()
  let l:contract  = expand('%:p')
  let l:cmd = 'clarity-lint' . ' --file ' . l:contract

  " Returns a dictionary from the command
  call s:UnPlaceMarkers()
  let l:resp = systemlist(l:cmd)
  call s:PlaceMarkers(l:resp, l:contract)
endfunction

function! s:PlaceMarkers(results, file)
   if len(a:results) == 0
		return 
   endif

   let s:sign_ids = []
   let l:index0 = 100
   let l:index  = l:index0
   let l:resp = json_decode(join(a:results))
   let l:spans =get(l:resp, 'spans')
   let b:clarity_lint_dict = {}
   for span in l:spans
	 let b:clarity_lint_dict[span.start_line] = l:resp.message
     execute ':sign place '.index.' name=Clarity'.l:resp.level.'Sign'.' line='.span.start_line.' file='.a:file
	 call add(s:sign_ids, l:index)
     let l:index += 1
   endfor
endfunction

" Add unplace markers, and add highlighting for the various levels of logging
function! s:UnPlaceMarkers()
    if exists('s:sign_ids')
        for i in s:sign_ids
            execute ':sign unplace '.i
        endfor
        unlet s:sign_ids
    endif
endfunction
