local ignore_list = {'.git', 'node_modules', '.cache'}

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_ignore = ignore_list

require('nvim-tree').setup {
  lsp_diagnostics = true,
  update_focused_file = {
    enable = true,
    update_cwd  = true,
    ignore_list = ignore_list
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
