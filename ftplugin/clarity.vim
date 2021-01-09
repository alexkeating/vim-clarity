" Make sure block stack cli is installed 
" If it is not installed install
" Check that npm is installed if it is not installed, install
"
" Once the cli is installed define the two commands to check value and deploy
" contract
"
" The setup instal clarity lsp


" if !executable('stx')
"   echom 'Please install the stacks cli'
"   finish
" endif


" Use current file as the contract file (potentially take a directory in the
" future)
"
" User supplies name, and cost
" nonce is set to 0 and can be conditionally overriden
" Private key can be pull from a private variable or it can be provided


" Run a shell command.
"
" It will temporary set the shell to /bin/sh for Unix-like systems if possible,
" so that we always use a standard POSIX-compatible Bourne shell (and not e.g.
" csh, fish, etc.) See #988 and #1276.
" function! s:system(cmd, ...) abort
"   " Preserve original shell, shellredir and shellcmdflag values
"   let l:shell = &shell
"   let l:shellredir = &shellredir
"   let l:shellcmdflag = &shellcmdflag
" 
"   if !go#util#IsWin() && executable('/bin/sh')
"       set shell=/bin/sh shellredir=>%s\ 2>&1 shellcmdflag=-c
"   endif
" 
"   if go#util#IsWin()
"     if executable($COMSPEC)
"       let &shell = $COMSPEC
"       set shellcmdflag=/C
"     endif
"   endif
" 
"   try
"     return call('system', [a:cmd] + a:000)
"   finally
"     " Restore original values
"     let &shell = l:shell
"     let &shellredir = l:shellredir
"     let &shellcmdflag = l:shellcmdflag
"   endtry
" endfunction



