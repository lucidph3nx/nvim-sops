if exists('g:loaded_nvim_sops')
  finish
endif

command! SopsDecrypt lua require('nvim_sops').commands.file_decrypt()
command! SopsEncrypt lua require('nvim_sops').commands.file_encrypt()

if !exists('g:__nvim_sops_setup_completed')
    lua require("nvim_sops").setup {}
endif

lua require('nvim_sops').init()

let g:loaded_nvim_sops = 1
