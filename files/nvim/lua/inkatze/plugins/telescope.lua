local telescope = {}

function telescope.mappings()
  local builtin = require("telescope.builtin")
  local opts = { noremap = true, silent = true }
  local wk = require("which-key")

  wk.register({
    f = {
      name = "Telescope find", -- optional group name
      b = { builtin.buffers, "Find buffers", opts },
      f = { builtin.find_files, "Find files" }, -- create a binding with label
      g = { builtin.live_grep, "Live grep" },
      h = { builtin.help_tags, "Help tags" },
    },
    g = {
      name = "Telescope git",
      bc = { builtin.git_bcommits, "Git buffer commits" },
      br = { builtin.git_branches, "Git branches" },
      c = { builtin.git_commits, "Git commits" },
      f = { builtin.git_files, "Git files" },
      st = { builtin.git_status, "Git status" },
      sh = { builtin.git_stash, "Git stash" },
    },
  }, { prefix = "<leader>" })
end

function telescope.config()
  if not require("inkatze.plugins.packer").is_installed("telescope.nvim") then
    return nil
  end

  local t = require("telescope")

  t.setup({
    defaults = {
      layout_strategy = "horizontal",
      file_ignore_patterns = { "node%_modules/.*", "%.rbi", "log/.*", "tmp/.*", "ar%_doc/" },
    },
  })

  telescope.mappings()
end

return telescope
