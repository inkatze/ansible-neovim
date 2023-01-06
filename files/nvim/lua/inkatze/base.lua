-- Layout
vim.wo.number = true -- show line number

-- Indentation
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true -- Highlight search
vim.opt.ignorecase = true -- Case insensitive
vim.opt.incsearch = true -- Search as you type
vim.opt.infercase = true
vim.opt.smartcase = true

-- Editor
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.shell = "fish"
vim.opt.pumblend = 5 -- pseudo-transparency for pop-up menu

-- Highlight
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.g.mapleader = ","

-- Makes invisible chars visible
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- Autoformat on save for the given file patterns
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.lua", "*.luau", "*.ex", "*.exs" },
  callback = function() vim.lsp.buf.format() end,
})
