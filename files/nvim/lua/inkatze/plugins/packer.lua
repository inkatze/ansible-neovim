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
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
          require("inkatze.plugins.telescope").config()
        end,
      })

      use({
        "folke/which-key.nvim",
        config = require("inkatze.plugins.which-key").config,
      })

      use({ -- neovim's lsp pre-configurations
        "neovim/nvim-lspconfig",
        config = function()
          require("inkatze.plugins.lspconfig")
        end,
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
      })

      use({ -- Use correct comment token
        "tpope/vim-commentary",
      })

      use({
        "rcarriga/nvim-notify",
        config = require("inkatze.plugins.nvim-notify").config,
      })
      use({
        "j-hui/fidget.nvim",
        config = require("inkatze.plugins.fidget").config,
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
