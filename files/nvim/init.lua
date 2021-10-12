local lspsaga_config = require('configs.lspsaga')
local nvim_tree_config = require('configs.nvim-tree')

local opts = { noremap = true, silent = true }

require('packer').startup(function()
  use 'wbthomason/packer.nvim'  -- package manager
  use {  -- Fancy tab/buffer bar
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
    event = 'BufEnter *'
  }
  use {  -- File explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    opt = true,
    config = nvim_tree_config.config,
    setup = nvim_tree_config.settings
  }

  use { -- neovim's lsp pre-configurations
    'neovim/nvim-lspconfig',
    event = 'BufEnter *',
    config = function() require('configs.lspconfig') end
  }
  use {  -- Fancy symbol trees for syntax and others
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter *',
    config = function() require('configs.nvim-treesitter') end
  }
  use {  -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd = 'Telescope',
    setup = function() require('configs.telescope') end
  }
  use {  -- LSP in-editor errors and warnings
    'glepnir/lspsaga.nvim',
    requires = 'neovim/nvim-lspconfig',
    cmd = 'Lspsaga',
    config = lspsaga_config.config,
    setup = lspsaga_config.settings
  }
  use {  -- Completion
    'hrsh7th/nvim-compe',
    event = 'BufEnter *',
    config = function() require('configs.compe') end
  }
  use {  -- Status bar
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    opt = true,
    event = 'VimEnter *',
    config = function() require('configs.lualine') end
  }
  use {  -- Git changes indication in buffer
    'mhinz/vim-signify',
    event = 'BufEnter *',
    config = function() require('configs.signify') end
  }
  use {'tpope/vim-fugitive', event = 'VimEnter *'}  -- Git commands for vim
  use { -- Auto-pairs with nvim-treesitter integration
    'windwp/nvim-autopairs',
    event = 'VimEnter *',
    requires = {{'hrsh7th/nvim-compe'}},
    config = require('configs.nvim-autopairs').config
  }
  use {'kristijanhusak/vim-carbon-now-sh', cmd = 'CarbonNowSh'}  -- Nice snippet screenshot plugin

  use {'tpope/vim-rails', ft = 'ruby'} -- Rails support
  use { -- Project navigation
    'tpope/vim-projectionist',
    ft = 'ruby',
    config = function() require('configs.projectionist') end
  }
  use {
    'tpope/vim-commentary',
    event = 'BufEnter *'
  }

  use {  -- colorscheme
    'Pocco81/Catppuccino.nvim',
    config = function() require('configs.colorscheme') end
  }
end)

require('configs.options')
