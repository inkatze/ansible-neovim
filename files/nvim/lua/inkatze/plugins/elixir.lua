local M = {}

M.config = function()
  local elixir = require("elixir")
  local elixirls = require("elixir.elixirls")

  elixir.setup({
    nextls = {
      enable = false, -- defaults to false
      port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
      cmd = "path/to/next-ls", -- path to the executable. mutually exclusive with `port`
      version = "0.5.0", -- version of Next LS to install and use. defaults to the latest version
      on_attach = require("inkatze.lspconfig").on_attach,
    },
    credo = {
      enable = true, -- defaults to true
      port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
      on_attach = require("inkatze.lspconfig").on_attach,
    },
    elixirls = {
      enable = true,
      settings = elixirls.settings({
        dialyzerEnabled = true,
        fetchDeps = true,
        enableTestLenses = true,
        suggestSpecs = true,
      }),
      on_attach = require("inkatze.lspconfig").on_attach,
    },
  })
end

return M
