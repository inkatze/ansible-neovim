local opt = vim.opt

opt.completeopt = {'menuone', 'noinsert', 'noselect'}

-- Use <Tab> and <S-Tab> to navigate through popup menu
local cmd = vim.cmd
-- cmd 'inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"'
-- cmd 'inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"'


-- Use <Tab> and <S-Tab> to navigate through popup menu
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map('i', '<expr><tab>', 'pumvisible() ? "\<c-n>" : "\<tab>"', opts)
-- map('i', '<expr><s-tab>', 'pumvisible() ? "\<c-p>" : "\<s-tab>"', opts)
