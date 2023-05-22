local M = {}

M.setup = function()
  require("lspconfig").ruby_ls.setup({
    on_attach = require("inkatze.lspconfig").on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  require("lspconfig").sorbet.setup({
    on_attach = require("inkatze.lspconfig").on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
