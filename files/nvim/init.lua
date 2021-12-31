require('packer').startup(function()
  -- Core ->> 1
  use 'wbthomason/packer.nvim'  -- package manager
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
  use {  -- Colored delimiters
    'p00f/nvim-ts-rainbow',
    requires = 'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter *',
  }
  use {  -- Completion
    'hrsh7th/nvim-compe',
    event = 'BufEnter *',
    config = function() require('configs.compe') end
  }

  -- File/Buffer navigation ->> 1
  use {  -- Fancy tab/buffer bar
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
    event = 'BufEnter *'
  }
  use {  -- File explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    event = 'VimEnter *',
    opt = true,
    config = require('configs.nvim-tree').config,
    setup = require('configs.nvim-tree').setup
  }
  use { -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}, {'sudormrfbin/cheatsheet.nvim', opt = true}},
    cmd = 'Telescope',
    config = require('configs.telescope').config,
    setup = require('configs.telescope').setup
  }
  use { -- Project navigation
    'tpope/vim-projectionist',
    ft = 'ruby',
    config = function() require('configs.projectionist') end
  }

  -- LSP actions & diagnostics ->> 1
  use {  -- LSP in-editor errors and warnings
    'glepnir/lspsaga.nvim',
    requires = 'neovim/nvim-lspconfig',
    cmd = 'Lspsaga',
    config = require('configs.lspsaga').config,
    setup = require('configs.lspsaga').settings
  }
  use {
    'folke/trouble.nvim',
    config = function() require('configs.trouble') end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Cosmetics ->> 1
  use {  -- colorscheme
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function() require('configs.colorscheme') end
  }
  use {  -- Status bar
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    opt = true,
    event = 'VimEnter *',
    config = function() require('configs.lualine') end
  }

  -- Git ->> 1
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter *',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('configs.gitsigns') end
  }
  use {'tpope/vim-fugitive', event = 'VimEnter *'}  -- Git commands for vim
  use {
    'TimUntersberger/neogit',
    event = 'VimEnter *',
    config = function() require('configs.neogit') end,
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Text editing helpers ->> 1
  use { -- Auto-pairs with nvim-treesitter integration
    'windwp/nvim-autopairs',
    event = 'VimEnter *',
    requires = {{'hrsh7th/nvim-compe'}},
    config = require('configs.nvim-autopairs').config
  }
  use {  -- Use correct comment token
    'tpope/vim-commentary',
    event = 'BufEnter *'
  }
  use {
    'mattn/emmet-vim',
    event = 'BufEnter *',
    config = function() require('configs.emmet') end
  }
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation guides
  use {
    'phaazon/hop.nvim',
    event = 'BufEnter',
    config = require('configs.hop').config,
    setup = require('configs.hop').setup
  }

  -- Sharing ->> 1
  use {'kristijanhusak/vim-carbon-now-sh', cmd = 'CarbonNowSh', opt = true}  -- Nice snippet screenshot plugin

  -- Language specific ->> 1
  -- Ruby ->> 2
  use {'tpope/vim-rails', ft = 'ruby'} -- Rails support

  -- PH💩
  use {'phpactor/phpactor', run = 'composer install --no-dev -o', ft = 'php'}

  -- Fish ->> 2
  use { 'dag/vim-fish', ft = 'fish' }
end)

require('configs.options')
