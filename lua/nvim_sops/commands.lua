local debug = require('nvim_sops.utils').debug
local sops = require('nvim_sops.sops')
local M = {}


M.file_encrypt = function()
  print('not yet implemented')
end

M.file_decrypt = function()
  local input_file = vim.fn.expand('%:p')
  debug('decrypting', input_file)
  local binary = vim.g.nvim_sops_bin_path .. ' '
  local sops_options = sops.get_sops_general_options()

  local envs = ""
  for key, value in pairs(sops_options.sopsGeneralEnvVars) do
    envs = envs .. key .. '=' .. value .. ' '
  end

  local args = {
    '--decrypt',
    '--in-place',
  }

  local command = envs .. binary .. table.concat(args, ' ')

  local success = vim.fn.system(command)
  debug(success)
  if vim.v.shell_error ~= 0 then
    print('Error decrypting file: ' .. input_file)
  end

   -- reload the buffer to show the decrypted content
  vim.api.nvim_command('edit')
end

return M
