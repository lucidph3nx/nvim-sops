if exists('g:loaded_nvim_sops')
  finish
endif

command! SopsDecrypt lua require('nvim-sops.commands').file_decrypt()
command! SopsEncrypt lua require('nvim-sops.commands').file_encrypt()

if !exists('g:__indent_blankline_setup_completed')
    lua require("indent_blankline").setup {}
endif

lua require('nvim_sops').init()

let g:loaded_nvim_sops = 1
