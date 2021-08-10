telescope = require('telescope')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)
