return require('packer').startup(function()
  use 'wbthomason/packer.nvim'  -- package manager
  use 'marko-cerovac/material.nvim'  -- colorscheme

  use {  -- Fancy tab/buffer bar
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {  -- File explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use 'neovim/nvim-lspconfig'  -- neovim's lsp pre-configurations
  use { 'nvim-treesitter/nvim-treesitter' }  -- Fancy symbol trees for syntax and others
  use {  -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {  -- LSP in-editor errors and warnings
    'glepnir/lspsaga.nvim',
    requires = 'neovim/nvim-lspconfig'
  }
end)