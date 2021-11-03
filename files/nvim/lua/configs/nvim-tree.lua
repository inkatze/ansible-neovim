local ignore_list = {'.git', 'node_modules', '.cache'}
local nvim_tree_config = {}

function nvim_tree_config.config()
  require('nvim-tree').setup {
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable = true,
      update_cwd  = true,
      ignore_list = ignore_list
    },
  }
end

function nvim_tree_config.settings()
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_ignore = ignore_list
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
  vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
  }
end

return nvim_tree_config
