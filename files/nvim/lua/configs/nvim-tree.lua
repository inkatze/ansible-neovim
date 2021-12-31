local ignore_list = {'.git', 'node_modules/*', '.cache'}
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
    git = {
      enable = false,
      ignore = false,
      timeout = 300
    },
    view = {
      auto_resize = true,
    },
    update_focused_file = {
      enable = false,
      update_cwd  = false,
      ignore_list = ignore_list
    }
  }
end

function nvim_tree_config.setup()
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_git_hl = 0
  vim.g.nvim_tree_ignore = ignore_list
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
  vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
  vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
  }
end

return nvim_tree_config
