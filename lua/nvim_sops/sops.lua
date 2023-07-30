local debug = require("nvim_sops.utils").debug
local M = {}

M.get_sops_general_options = function()
  local awsProfile = vim.g.nvim_sops_defaults_aws_profile
  local gcpCredentialsPath = vim.g.nvim_sops_defaults_gcp_credentials_path
  local ageKeyFile = vim.g.nvim_sops_defaults_age_key_file
  debug('config',  { awsProfile, gcpCredentialsPath, ageKeyFile } )

  local sopsGeneralEnvVars = {}

  if awsProfile then
    sopsGeneralEnvVars.AWS_PROFILE = awsProfile
  end

  if gcpCredentialsPath then
    sopsGeneralEnvVars.GOOGLE_APPLICATION_CREDENTIALS = gcpCredentialsPath
  end

  if ageKeyFile then
    sopsGeneralEnvVars.SOPS_AGE_KEY_FILE = ageKeyFile
  end

  debug('sops options', {sopsGeneralEnvVars})

  return {
    sopsGeneralEnvVars,
  }
end

return M
