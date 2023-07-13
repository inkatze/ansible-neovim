local M = {}

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

M.start = function()
  local packer_bootstrap = ensure_packer()
  require("packer").startup({
    function(use)
      -- No config and support plugins
      use("wbthomason/packer.nvim")
      use("kyazdani42/nvim-web-devicons")
      use("romgrk/barbar.nvim")
      use("nvim-lua/plenary.nvim")
      use("tpope/vim-commentary")
      use("onsails/lspkind.nvim")
      use("mfussenegger/nvim-dap")

      -- Completion related plugins
      use("hrsh7th/cmp-nvim-lsp")
      use("hrsh7th/cmp-buffer")
      use("hrsh7th/cmp-path")
      use("hrsh7th/cmp-cmdline")
      use("hrsh7th/cmp-vsnip")
      use("hrsh7th/vim-vsnip")
      use({ "mtoohey31/cmp-fish", ft = "fish" })

      use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = require("inkatze.plugins.catppuccin").config,
      })

      use({ "lukas-reineke/indent-blankline.nvim", config = require("inkatze.plugins.indent-blankline").cofig })

      use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = function()
          require("inkatze.plugins.telescope").config()
        end,
      })

      use({
        "hrsh7th/nvim-cmp",
        requires = {},
        config = require("inkatze.plugins.nvim-cmp").config,
      })

      use({
        "folke/which-key.nvim",
        config = require("inkatze.plugins.which-key").config,
      })

      use({
        -- neovim's lsp pre-configurations
        "neovim/nvim-lspconfig",
        config = require("inkatze.plugins.lspconfig").config,
        run = "brew install lua-language-server efm-langserver",
      })

      use({
        -- Fancy symbol trees for syntax and others
        "nvim-treesitter/nvim-treesitter",
        config = require("inkatze.plugins.nvim-treesitter").config,
        run = function()
          vim.fn.system({ "brew", "install", "tree-sitter" })
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
      })

      use({
        "jose-elias-alvarez/null-ls.nvim",
        run = "brew install stylua",
        config = require("inkatze.plugins.null-ls").config,
      })

      use({
        "j-hui/fidget.nvim",
        config = require("inkatze.plugins.fidget").config,
        tag = "legacy",
      })

      use({
        "lewis6991/gitsigns.nvim",
        config = require("inkatze.plugins.gitsigns").config,
      })

      use({
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({})
        end,
      })

      use({
        "nvim-tree/nvim-tree.lua",
        tag = "nightly", -- optional, updated every week. (see issue #1193)
        config = require("inkatze.plugins.nvim-tree").config,
      })

      use({
        "folke/trouble.nvim",
        config = require("inkatze.plugins.trouble").config,
      })

      use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        event = "BufRead",
        config = require("inkatze.plugins.lspsaga").config,
      })

      use({
        "rcarriga/nvim-dap-ui",
        config = require("inkatze.plugins.dapui").config,
      })

      use({
        "elixir-tools/elixir-tools.nvim",
        config = require("inkatze.plugins.elixir").config,
        ft = { "elixir", "eelixir", "heex", "surface" },
        tag = "stable",
        requires = { "nvim-lua/plenary.nvim" },
      })

      use({
        "nvim-lualine/lualine.nvim",
        config = require("inkatze.plugins.lualine").config,
        event = "BufAdd",
      })

      use({
        "github/copilot.vim",
        run = ":Copilot setup",
      })

      use({
        "mfussenegger/nvim-jdtls",
        run = "./scripts/link_mac.sh && mvn package -DskipTests",
      })

      use({ "tpope/vim-projectionist" })

      if packer_bootstrap then
        require("packer").sync()
      end
    end,
    config = {
      autoremove = true,
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "single" })
        end,
      },
      profile = { enable = true, threshold = 100 },
    },
  })
end

return M
