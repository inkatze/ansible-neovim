local opt = vim.opt
local g   = vim.g
local cmd = vim.cmd

g.mapleader = ','
g.maplocalleader = ','

-- Editor behavior ->>1
opt.expandtab = true -- Tabs are the devil's work
opt.hidden = true
opt.history = 1000
opt.backup = false -- No backup after editing
opt.writebackup = false -- No backups made while editing
opt.printoptions = 'paper:letter'
opt.scroll = 4 -- Number of lines to scroll with ^U ^D
opt.softtabstop = 4 -- Makes you think that your spaces are tabs
opt.shortmess:append('Ac')  -- Ignore swamp files and don't pass completion messages
opt.tabstop = 4 -- The all powerfull tab number
opt.formatoptions:append('j') -- Smarter line joins
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.signcolumn = 'yes' -- Always show the signcolumn

-- Cosmetics
opt.laststatus = 2 -- Always show the status bar
opt.linebreak = true -- Break lines by word, not by char
opt.mouse = 'nvc' -- You can use the mouse, but not in insert mode
opt.number = true -- Show line numbers
opt.ruler = true -- Show row and col percentage
opt.scrolloff = 20 -- Kind of a cursor margin
opt.shiftround = true -- Inteligent indent. roud the spaces of the shift width
opt.showbreak = '↲' -- Show me where you broke my lines
opt.showmatch = true -- Highlight matching parentesis, braces, etc.
opt.sidescrolloff = 8 -- Side margins
opt.joinspaces = false  -- no double spaces with join
opt.list = true -- Show some invisible characters
opt.wrap = false  -- Disable line wrap
opt.termguicolors = true  -- True color support

-- Search
opt.hlsearch = true -- Highlight search
opt.ignorecase = true -- Case insensitive
opt.incsearch = true -- Search as you type
opt.infercase = true
opt.smartcase = true
opt.suffixes:append('.pyc') -- Ignore these extensions when autocompleting files
opt.wildmode = {'list', 'longest', 'full'} -- Show me ALL posible completitions

-- Color and syntax
opt.cursorline = true  -- highlights the line where the cursor is present

-- performance tweaks
opt.lazyredraw = true

-- autocommands
cmd 'autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab autowrite'
cmd 'autocmd FileType json setlocal ts=2 sts=2 sw=2 conceallevel=0 expandtab'
cmd 'autocmd FileType fish setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab'
cmd 'autocmd FileType proto setlocal ts=2 sts=2 sw=2 expandtab'

-- General mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>cp', '<cmd>let @@ = expand("%")<CR>', opts)
map('n', '<leader>cp+', '<cmd>let @+ = expand("%")<CR>', opts)
map('n', '<leader>CP', '<cmd>let @@ = expand("%:p")<CR>', opts)
map('n', '<leader>CP+', '<cmd>let @+ = expand("%:p")<CR>', opts)

-- Buffer navigation
map('', '<s-left>', '<cmd>bp<cr>', opts)
map('', '<s-right>', '<cmd>bn<cr>', opts)


-- Keep my text highlighted plz
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map('n', 'hl', '<cmd>nohl<cr>', opts)

-- Folding mappings
map('n', '<space>', 'za', opts)
map('n', '<cr>', 'za', opts)
map('n', '<leader>f', 'zR', opts)
map('n', '<leader>ff', 'zM', opts)
map('v', '<space>', 'zf', opts)
