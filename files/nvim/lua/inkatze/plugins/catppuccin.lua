local catppuccin = {}

function catppuccin.config()
  if not require("inkatze.plugins.packer").is_installed("catppuccin") then
    return nil
  end

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
      fidget = true,
      lsp_trouble = false,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = false,
      telescope = true,
      nvimtree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = false,
        colored_indent_levels = false,
      },
      dashboard = false,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = false,
      markdown = false,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      cmp = false,
      notify = true,
      dap = {
        enabled = false,
        enable_ui = false,
      },
    },
  })

  vim.cmd.colorscheme("catppuccin")
end

return catppuccin
