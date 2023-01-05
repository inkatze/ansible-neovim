local M = {}

function M.config()
  local packer = require("inkatze.plugins.packer")
  if not packer.is_installed("lspsaga.nvim") or not packer.is_installed("catppuccin") then
    return nil
  end

  local saga = require("lspsaga")

  saga.init_lsp_saga({
    custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
  })

  if not require("inkatze.plugins.packer").is_installed("which-key.nvim") then
    return nil
  end

  local jump_to_prev_error = function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end

  local jump_to_next_error = function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end

  local wk = require("which-key")

  wk.register({
    -- use <C-t> to jump back
    name = "lspsaga commands",
    gd = {
      "<cmd>Lspsaga lsp_finder<CR>",
      "lspsaga finder find the symbol definition implement reference",
      silent = true,
    },
    gr = { "<cmd>Lspsaga rename<CR>", "lspsaga rename", silent = true },
    gp = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition", silent = true },
    K = { "<cmd>Lspsaga hover_doc<CR>", "Hover doc", silent = true },
    ["<A-d>"] = { "<cmd>Lspsaga open_floaterm<CR>", "Float terminal", silent = true },
    ["<A-g>"] = { "<cmd>Lspsaga open_floaterm lazygit<CR>", "Opens lazygit", silent = true },
    ["<A-x>"] = { [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], "Close float terminal", silent = true, mode = "t" },
    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to previous diagnostic", silent = true },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostic", silent = true },
    ["[E"] = { jump_to_prev_error, "Jump to previous error", silent = true },
    ["]E"] = { jump_to_next_error, "Jump to next error", silent = true },
  })

  wk.register({
    name = "lspsaga commands",
    ca = { "<cmd>Lspsaga code_action<CR>", "Code action", mode = { "n", "v" }, silent = true },
    cd = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics", silent = true },
    ccd = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostics", silent = true },
    o = { "<cmd>Lspsaga outline<CR>", "Objects outline", silent = true },
  }, { prefix = "<leader>" })
end

return M
