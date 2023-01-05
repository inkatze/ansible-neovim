local M = {}

local runtime_path = vim.split(package.path, ";")

local function load_lspconfig()
  require("lspconfig").sumneko_lua.setup({
    filetypes = { "lua" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })
end

function M.setup()
  local packer = require("inkatze.plugins.packer")

  if packer.is_installed("nvim-lspconfig") and packer.is_installed("cmp-nvim-lsp") then
    load_lspconfig()
  end
end

return M
