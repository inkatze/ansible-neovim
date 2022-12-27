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

function packer.start()
  local packer_bootstrap = ensure_packer()

  if not packer_bootstrap then
    return false
  end

  require("packer").startup(function(use)
    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("inkatze.plugins.catppuccin")
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = require("inkatze.plugins.telescope").config,
    })

    use({
      "folke/which-key.nvim",
      config = function()
        require("inkatze.plugins.which-key")
      end,
    })

    use({ -- neovim's lsp pre-configurations
      "neovim/nvim-lspconfig",
      config = function()
        require("inkatze.plugins.lspconfig")
      end,
    })

    use({ -- Fancy symbol trees for syntax and others
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("inkatze.plugins.nvim-treesitter")
      end,
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("inkatze.plugins.null-ls")
      end,
      run = "brew install stylua",
    })

    use({ -- Use correct comment token
      "tpope/vim-commentary",
    })

    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end

return packer
