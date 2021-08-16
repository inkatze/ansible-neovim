local opts = { noremap = true, silent = true }

vim.g.nvim_tree_follow = 1
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
