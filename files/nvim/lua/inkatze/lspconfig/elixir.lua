local M = {}

M.setup = function()
  require("lspconfig").efm.setup({
    filetypes = { "elixir", "eelixir", "heex", "surface" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = require("inkatze.lspconfig").on_attach,
  })
end

return M
