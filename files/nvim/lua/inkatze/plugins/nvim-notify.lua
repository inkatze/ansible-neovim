local notify = {}

function notify.config()
  if not require("inkatze.plugins.packer").is_installed("nvim-notify") then
    return nil
  end

  vim.notify = require("notify")
end

return notify
