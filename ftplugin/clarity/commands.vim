command! -nargs=* StxDeployMainnet call clarity#stxcli#MainnetContractDeploy(<f-args>)
command! -nargs=* StxDeployTestnet call clarity#stxcli#TestnetContractDeploy(<f-args>)
command! -nargs=* StxDeployLocal call clarity#stxcli#LocalContractDeploy(<f-args>)
