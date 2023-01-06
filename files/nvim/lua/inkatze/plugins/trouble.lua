local M = {}

M.config = function()
  require("trouble").setup({
    auto_close = true,
  })
end

return M
