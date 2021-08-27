local catppuccino = require('catppuccino')

-- configure it
catppuccino.setup(
  {
    colorscheme = 'catppuccino',
    transparency = false,
    styles = {
      comments = 'italic',
      functions = 'italic',
      keywords = 'italic',
      strings = 'NONE',
      variables = 'NONE',
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        styles = {
          errors = 'italic',
          hints = 'italic',
          warnings = 'italic',
          information = 'italic'
        }
      },
      lsp_trouble = false,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = false,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true
      },
      which_key = false,
      indent_blankline = true,
      dashboard = false,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = true,
      bufferline = false,
      markdown = true,
    }
  }
)

-- load it
catppuccino.load()
