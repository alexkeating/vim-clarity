if exists("b:current_syntax")
    finish
endif

if exists("g:clarity_isk")
 exe "setl isk=".g:clarity_isk
elseif (v:version == 704 && has("patch-7.4.1142")) || v:version > 704
 syn iskeyword 38,42,43,45,47-58,60-63,64-90,97-122,_
else
 setl isk=38,42,43,45,47-58,60-63,64-90,97-122,_
endif


echom "Our syntax highlighting code will go here."


" Functions
" syntax region clarityFunction start="\v(\@<=\()(define-map)\s([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*)\s\+" end="(?=\\))"
"

" Clustrer
syn cluster			clarityBaseListCluster	contains=clarityComment,clarityFunc,clarityKey,clarityOperators,clarityExcep,clarityConditional,clarityNumber,clarityConstant,clarityBoolean
syn cluster			clarityListCluster		contains=@clarityBaseListCluster,clarityString


"-----------------------------------------------------
" Rainbow highlighting

syn region			clarityString			start=+"+ skip=+\\\\\|\\"+ end=+"+	contains=@Spell
syn region			clarityString			start=+u"+ skip=+\\\\\|\\"+ end=+"+	contains=@Spell

syn region clarityParen0           matchgroup=hlLevel0 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen1
syn region clarityParen1 contained matchgroup=hlLevel1 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen2
syn region clarityParen2 contained matchgroup=hlLevel2 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen3
syn region clarityParen3 contained matchgroup=hlLevel3 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen4
syn region clarityParen4 contained matchgroup=hlLevel4 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen5
syn region clarityParen5 contained matchgroup=hlLevel5 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen6
syn region clarityParen6 contained matchgroup=hlLevel6 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen7
syn region clarityParen7 contained matchgroup=hlLevel7 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen8
syn region clarityParen8 contained matchgroup=hlLevel8 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen9
syn region clarityParen9 contained matchgroup=hlLevel9 start="`\=(" end=")" skip="|.\{-}|" contains=@clarityListCluster,clarityParen0


syntax match clarityComment "\v;;.*"
syntax match clarityNumber "\vu?[0-9]{1,9}"
syntax match clarityBoolean "\v(true|false)"

" -------------------------------------------
"  Clarity Operators
" syn keyword clarityOp		-						*					/
" syn keyword clarityOp		+						<					<=
" syn keyword clarityOp		>						>=					and
" syn keyword clarityOp		or                      not

syn match clarityOperators "\(\s\|(\)\@<=-\|*\|/\|+\|<=\|<\|>=\|>\|and\|or\|not\(\s\|(\)"
syn match clarityOperators "\(\s\|(\)\@<=mod\|pow\|xor\(\s\|(\)"

" --------------------------------------------------
" Clarity Conditionals
syn match clarityConditional "\(\s\|(\)\@<=if\|match\(\s\|(\)"


" Clarity Exception
syn match clarityExcep "\(\s\|(\)\@<=err\|try!\|unwrap-err-panic\|unwrap-err!\|unwrap-panic\|unwrap!\(\s\|(\)"


syn keyword clarityFunc		append		    		as-contract	    	as-max-len?
syn keyword clarityFunc		asserts!				at-block	    	begin
syn keyword clarityFunc		default-to				define-constant		define-data-var
syn keyword clarityFunc		define-fungible-token	define-map		    define-non-fungible-token
syn keyword clarityFunc		define-private			define-public		define-read-only
syn keyword clarityFunc		define-trait			element-at		    
syn keyword clarityFunc		filter			        fold		        ft-burn?
syn keyword clarityFunc		ft-get-balance			ft-get-supply		ft-mint?
syn keyword clarityFunc		ft-transfer?			get		            get-block-info?
syn keyword clarityFunc		hash160			                            impl-trait
syn keyword clarityFunc		index-of			    is-eq		        is-err
syn keyword clarityFunc		is-none			        is-ok		        is-some
syn keyword clarityFunc					            log2		        
syn keyword clarityFunc		map-delete			    map-get?		    map-insert
syn keyword clarityFunc		map-set			        		            merge
syn keyword clarityFunc					            nft-burn?		    nft-get-owner?
syn keyword clarityFunc		nft-mint?			    nft-transfer?	    
syn keyword clarityFunc		ok			            		            
syn keyword clarityFunc		principal-of?			print		        secp256k1-recover?
syn keyword clarityFunc		secp256k1-verify	    sha256		        sha512
syn keyword clarityFunc		sha512/256			    some		        sqrti
syn keyword clarityFunc		stx-burn?			    stx-get-balance		stx-transfer?
syn keyword clarityFunc		to-int			        to-uint		        
syn keyword clarityFunc					        		            use-trait
syn keyword clarityFunc		var-get			        var-set		        
syn keyword clarityFunc     block-height            burn-block-height 
syn keyword clarityFunc     is-in-regtest           stx-liquid-supply

" -------------------------------
"  Clarity Keywords

syn keyword clarityKey none map list tuple principal uint int string respsonse optional buff string-ascii string-utf8 bool
syn keyword clarityConstant tx-sender contract-caller



" if exists("g:clarity_rainbow") && g:clarity_rainbow != 0
if &bg == "dark"
 hi def hlLevel0 ctermfg=red		  guifg=red1
 hi def hlLevel1 ctermfg=yellow	      guifg=orange1
 hi def hlLevel2 ctermfg=green	      guifg=yellow1
 hi def hlLevel3 ctermfg=cyan	      guifg=greenyellow
 hi def hlLevel4 ctermfg=magenta	  guifg=green1
 hi def hlLevel5 ctermfg=red		  guifg=springgreen1
 hi def hlLevel6 ctermfg=yellow	      guifg=cyan1
 hi def hlLevel7 ctermfg=green	      guifg=slateblue1
 hi def hlLevel8 ctermfg=cyan	      guifg=magenta1
 hi def hlLevel9 ctermfg=magenta	  guifg=purple1
else
 hi def hlLevel0 ctermfg=red		  guifg=red3
 hi def hlLevel1 ctermfg=darkyellow	  guifg=orangered3
 hi def hlLevel2 ctermfg=darkgreen	  guifg=orange2
 hi def hlLevel3 ctermfg=blue	      guifg=yellow3
 hi def hlLevel4 ctermfg=darkmagenta  guifg=olivedrab4
 hi def hlLevel5 ctermfg=red		  guifg=green4
 hi def hlLevel6 ctermfg=darkyellow	  guifg=paleturquoise3
 hi def hlLevel7 ctermfg=darkgreen	  guifg=deepskyblue4
 hi def hlLevel8 ctermfg=blue	      guifg=darkslateblue
 hi def hlLevel9 ctermfg=darkmagenta  guifg=darkviolet
endif
" else
  " hi def link clarityParen Delimiter
" endif


highlight def link clarityComment       Comment
highlight def link clarityConstant      Constant
highlight def link clarityBoolean       Boolean
highlight def link clarityConditional   Conditional
highlight def link clarityExcep         Exception
highlight def link clarityString        String
highlight def link clarityNumber        Number
highlight def link clarityFunc          Statement
highlight def link clarityKey           Type
highlight def link clarityOperators     Operator

let b:current_syntax = "clarity"
