local M = {}

M.first_not_nil = function(...)
    for _, value in pairs { ... } do
        return value
    end
end

M.debug = function(...)
  if vim.g.nvim_sops_debug then
    print('DEBUG: ', ... )
  end
end

return M
