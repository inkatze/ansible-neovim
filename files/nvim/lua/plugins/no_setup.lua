return {
  -- No config and support plugins
  { "kyazdani42/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  "romgrk/barbar.nvim",
  "tpope/vim-commentary",
  "onsails/lspkind.nvim",
  "mfussenegger/nvim-dap",
  "DanilaMihailov/beacon.nvim",

  -- Completion related plugins
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-cmdline", lazy = true },
  { "hrsh7th/cmp-vsnip", lazy = true },
  { "hrsh7th/vim-vsnip", lazy = true },
  {
    "mtoohey31/cmp-fish",
    ft = "fish",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = {
      auto_close = true,
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
  },
  {
    "github/copilot.vim",
  },
  {
    "mfussenegger/nvim-jdtls",
    build = "./scripts/link_mac.sh && mvn package -DskipTests",
  },
  { "tpope/vim-projectionist" },
  { "olimorris/neotest-rspec", lazy = true },
  { "jfpedroza/neotest-elixir", lazy = true },
  { "haydenmeade/neotest-jest", lazy = true },
  {
    "j-hui/fidget.nvim",
    version = "legacy",
    event = "LspAttach",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
