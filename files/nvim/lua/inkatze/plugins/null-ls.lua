local M = {}

M.config = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
    },
    on_attach = require("inkatze.lspconfig").on_attach,
    debug = true
  })
end

return M
