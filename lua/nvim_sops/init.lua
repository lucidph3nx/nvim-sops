local utils = require "nvim_sops.utils"
local M = {}

M.init = function()
  if not vim.g.nvim_sops_namespace then
    vim.g.nvim_sops_namespace = vim.api.nvim_create_namespace "nvim_sops"
  end
end

M.setup = function(options)
  if options == nil then
    options = {}
  end
  if options.defaults == nil then
    options.defaults = {}
  end

  local o = utils.first_not_nil

  vim.g.nvim_sops_enabled = o(options.enabled, vim.g.nvim_sops_enabled, true)
  vim.g.nvim_sops_debug = o(options.debug, vim.g.nvim_sops_debug, false)
  vim.g.nvim_sops_bin_path = o(options.binPath, vim.g.nvim_sops_bin_path, "sops")

  vim.g.nvim_sops_defaults_aws_profile = o(options.defaults.awsProfile, vim.g.nvim_sops_defaults_aws_profile,
    os.getenv("AWS_PROFILE"))
  vim.g.nvim_sops_defaults_age_key_file = o(options.defaults.ageKeyFile, vim.g.nvim_sops_defaults_age_key_file,
    os.getenv("SOPS_AGE_KEY_FILE"))
  vim.g.nvim_sops_defaults_gcp_credentials_path = o(options.defaults.gcpCredentialsPath, vim.g.nvim_sops_defaults_gcp_credentials_path,
    os.getenv("GOOGLE_APPLICATION_CREDENTIALS"))

  vim.g.__nvim_sops_setup_completed = true
end

return M
