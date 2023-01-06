local M = {}

function M.setup()
  require("lspconfig").efm.setup({
    filetypes = { "elixir", "eelixir", "heex", "surface" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
