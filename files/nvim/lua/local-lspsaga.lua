local saga = require('lspsaga')

saga.init_lsp_saga()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>gf', '<cmd>Lspsaga lsp_finder<cr>', opts)
