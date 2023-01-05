local M = {}

function M.config()
  if not require("inkatze.plugins.packer").is_installed("null-ls.nvim") then
    return nil
  end

  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
    },
  })
end

return M
