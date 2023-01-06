local packer = {}

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

function packer.is_installed(plugin)
  if packer_plugins[plugin] and packer_plugins[plugin].loaded then
    return true
  else
    return false
  end
end

function packer.start()
  local packer_bootstrap = ensure_packer()

  require("packer").startup({
    function(use)
      use("wbthomason/packer.nvim")
      use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = require("inkatze.plugins.catppuccin").config,
      })

      use({
        "romgrk/barbar.nvim",
        requires = "kyazdani42/nvim-web-devicons",
      })

      use({ "lukas-reineke/indent-blankline.nvim", config = require("inkatze.plugins.indent-blankline").cofig })

      use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
          require("inkatze.plugins.telescope").config()
        end,
      })

      use({
        "hrsh7th/nvim-cmp",
        requires = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-buffer" },
          { "hrsh7th/cmp-path" },
          { "hrsh7th/cmp-cmdline" },
          { "neovim/nvim-lspconfig" },
          { "onsails/lspkind.nvim" },
          { "hrsh7th/cmp-vsnip" },
          { "hrsh7th/vim-vsnip" },
        },
        config = require("inkatze.plugins.nvim-cmp").config,
      })

      use({
        "folke/which-key.nvim",
        config = require("inkatze.plugins.which-key").config,
      })

      use({ -- neovim's lsp pre-configurations
        "neovim/nvim-lspconfig",
        config = require("inkatze.plugins.lspconfig").config,
        run = "brew install lua-language-server",
      })

      use({ -- Fancy symbol trees for syntax and others
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
        requires = { { "nvim-lua/plenary.nvim" } },
        run = "brew install stylua",
        config = require("inkatze.plugins.null-ls").config,
      })

      use({ -- Use correct comment token
        "tpope/vim-commentary",
      })

      use({
        "rcarriga/nvim-notify",
        config = require("inkatze.plugins.nvim-notify").config,
      })
      -- Packer
      use({
        "folke/noice.nvim",
        config = require("inkatze.plugins.noice").config,
        requires = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
        },
      })
      use({
        "j-hui/fidget.nvim",
        config = require("inkatze.plugins.fidget").config,
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
        requires = {
          "nvim-tree/nvim-web-devicons",
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
        config = require("inkatze.plugins.nvim-tree").config,
      })

      use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = require("inkatze.plugins.trouble").config,
      })

      use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = require("inkatze.plugins.lspsaga").config,
      })

      -- This one prevents the welcome screen from loading for some reason
      use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("inkatze.plugins.lualine").config,
      })

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

return packer
