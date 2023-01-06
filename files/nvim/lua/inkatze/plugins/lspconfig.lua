local M = {}

function M.config()
  require("inkatze.lspconfig.lua").setup()
  require("inkatze.lspconfig.elixir").setup()

  local wk = require("which-key")
  wk.register({
    ld = {
      name = "LSP diagnostics",
      o = { vim.diagnostic.open_float, "Opens float window with diagnostic information" },
      p = { vim.diagnostic.goto_prev, "Jump to pevious diagnostic" },
      n = { vim.diagnostic.goto_next, "Jump to next diagnostic" },
      l = { vim.diagnostic.setloclist, "Set loc list" },
    },
  }, { prefix = "<leader>", silent = true, nnoremap = true })

  require("lspkind").init({
    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = "symbol_text",

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = "codicons",

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "﬌",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
  })
end

return M
