function! clarity#stxcli#ContractDeploy(name, fee, nonce, payment_key, ...)
  " Get current contract and deploy
  let l:contract  = expand('%:p')
  let l:cmd = join(['!stx deploy_contract', l:contract, a:name, a:fee, a:nonce, a:payment_key], ' ')
  return l:cmd
endfunction

function! clarity#stxcli#MainnetContractDeploy(name, fee, nonce, payment_key, ...)
  let l:cmd = clarity#stxcli#ContractDeploy(a:name, a:fee, a:nonce, a:payment_key, a:000)
  execute l:cmd
endfunction

function! clarity#stxcli#TestnetContractDeploy(name, fee, nonce, payment_key, ...)
  let l:cmd = clarity#stxcli#ContractDeploy(a:name, a:fee, a:nonce, a:payment_key, a:000)
  let l:testnet_cmd = l:cmd . ' -t -T'
  execute l:testnet_cmd
endfunction

function! clarity#stxcli#LocalContractDeploy(name, fee, nonce, payment_key, ...)
  let l:cmd = clarity#stxcli#ContractDeploy(a:name, a:fee, a:nonce, a:payment_key, a:000)
  let l:local_cmd = l:cmd . ' -t -I http://localhost:20443'
  execute l:local_cmd
endfunction


