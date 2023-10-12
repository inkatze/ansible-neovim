local M = {}

M.setup = function()
  require("lspconfig").stylelint_lsp.setup({
    on_attach = require("inkatze.lspconfig").on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
