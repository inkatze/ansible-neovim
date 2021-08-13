local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)
map('n', '<c-f>', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
