require('catppuccin').setup(
  {
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {"italic"},
          hints = {"italic"},
          warnings = {"italic"},
          information = {"italic"},
        },
        underlines = {
          errors = {"underline"},
          hints = {"underline"},
          warnings = {"underline"},
          information = {"underline"},
        },
      },
      lsp_trouble = true,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      which_key = false,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = false,
      neogit = true,
      vim_sneak = false,
      fern = false,
      barbar = true,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = true,
      cmp = true,
      notify = true,
      dap = {
        enabled = true,
        enable_ui = true,
      },
    }
  }
)

vim.cmd.colorscheme 'catppuccin'
