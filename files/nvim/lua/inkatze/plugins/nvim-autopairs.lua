local M = {}

function M.config()
  if not require("inkatze.plugins.packer").is_installed("nvim-autopairs") then
    return nil
  end

  require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
  })
end

return M
