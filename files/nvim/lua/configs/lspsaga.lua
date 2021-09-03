local saga = require('lspsaga')

saga.init_lsp_saga()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>gd', '<cmd>Lspsaga lsp_finder<cr>', opts)
map('n', '<leader>gf', '<cmd>Lspsaga lsp_finder<cr>', opts)
map('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<cr>', opts)
map('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', opts)
map('n', '<leader>lr', '<cmd>Lspsaga rename<cr>', opts)
map('n', '<leader>ld', '<cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
map('n', '<leader>lk', '<cmd>Lspsaga hover_doc<cr>', opts)
