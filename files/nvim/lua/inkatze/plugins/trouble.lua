local M = {}

function M.config()
  if not require("inkatze.plugins.packer").is_installed("trouble.nvim") then
    return nil
  end

  require("trouble").setup({
    auto_open = true,
    auto_close = true,
  })
end

return M
