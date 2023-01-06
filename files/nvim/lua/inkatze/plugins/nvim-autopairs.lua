local M = {}

M.config = function()
  require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
  })
end

return M
