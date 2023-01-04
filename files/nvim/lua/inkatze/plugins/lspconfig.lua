-- local nvim_lsp = require('lspconfig')

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- -- vim.lsp.set_log_level("debug")

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(_, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cx', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fmt', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
-- end

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = {}

-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

-- nvim_lsp.diagnosticls.setup {
--   on_attach = on_attach,
--   filetypes = {
--     'javascript',
--     'javascriptreact',
--     'json',
--     'typescript',
--     'typescriptreact',
--     'css',
--     'less',
--     'scss',
--     'markdown',
--     'pandoc',
--     'ruby',
--     'html',
--   },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--fix-to-stdout', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       rubocop = {
--         sourceName = 'rubocop',
--         command = 'rubocop',
--         debounce = 100,
--         args = {
--           '--format',
--           'json',
--           '--force-exclusion',
--           '--stdin',
--           '%filepath',
--         },
--         parseJson = {
--           errorsRoot = 'files[0].offenses',
--           line = 'location.start_line',
--           endLine = 'location.last_line',
--           column = 'location.start_column',
--           endColumn = 'location.end_column',
--           message = '[rubocop] [${cop_name}] ${message}',
--           security = 'severity',
--         },
--         securities = {
--           fatal = 'error',
--           error = 'error',
--           warning = 'warning',
--           convention = 'info',
--           refactor = 'info',
--           info = 'info',
--         },
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--       ruby = 'rubocop'
--     },
--     formatters = {
--       eslint_d = {
--         command = 'npx',
--         args = { 'eslint_d', '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'npx',
--         args = { 'prettier', '--stdin-filepath', '%filename' }
--       },
--       rubocop = {
--         command = 'rubocop',
--         args = { '--auto-correct', '%filepath' },
--         doesWriteToFile = true,
--       },
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       html = 'prettier',
--       javascript = 'prettier',
--       javascriptreact = 'prettier',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'prettier',
--       typescriptreact = 'prettier',
--       markdown = 'prettier',
--       ruby = 'rubocop',
--     }
--   }
-- }

-- nvim_lsp.efm.setup {
--   filetypes = {"elixir", "eelixir", "heex", "surface"}
-- }
local lspconfig = {}

function lspconfig.config()
  if not require("inkatze.plugins.packer").is_installed("lspkind.nvim") then
    return nil
  end

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
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
  })
end

return lspconfig
