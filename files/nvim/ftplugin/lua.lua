vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function load_lspconfig()
	require("lspconfig").sumneko_lua.setup({
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
					meh = "  ",
				},
			},
		},
	})
end

local function load_formatter()
	local null_ls = require("null-ls")

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
		},
	})

	vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
end

local packer = require("inkatze.plugins.packer")

if packer.is_installed("nvim-lspconfig") then
	load_lspconfig()
end

if packer.is_installed("null-ls.nvim") then
	load_formatter()
end
