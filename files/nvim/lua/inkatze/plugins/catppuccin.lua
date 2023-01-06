local catppuccin = {}

function catppuccin.config()
  require("catppuccin").setup({
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
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      barbar = true,
      notify = true,
      telescope = true,
      fidget = true,
      which_key = true,
      cmp = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      nvimtree = {
        enabled = true,
        show_root = false,
        transparent_panel = false,
      },
      dap = {
        enabled = true,
        enable_ui = true,
      },
      gitsigns = true,
      lsp_trouble = true,
      lsp_saga = true,
      gitgutter = false,

      dashboard = false,
      neogit = false,
      vim_sneak = false,
      fern = false,
      bufferline = false,
      markdown = false,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
    },
  })

  vim.cmd.colorscheme("catppuccin")
end

return catppuccin
