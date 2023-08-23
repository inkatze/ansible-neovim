local M = {}

M.config = function()
  require("dropbar").setup()
  require("which-key").register({
    d = {
      name = "dropbar commands",
      p = { "<cmd>lua require('dropbar.api').pick()<CR>", "Dropbar pick" },
    },
  }, { prefix = "<leader>", silent = true })
end

return M
