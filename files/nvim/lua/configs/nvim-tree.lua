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
    update_focused_file = {
      enable = false,
      update_cwd  = false,
      ignore_list = ignore_list
    },
    renderer = {
      highlight_opened_files = 'all',
      highlight_git = false,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
        }
      }
    },
    filters = {
      custom = ignore_list
    }
  }
end

function nvim_tree_config.setup()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
  vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
end

return nvim_tree_config
