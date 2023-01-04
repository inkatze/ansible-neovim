local notify = {}

function notify.config()
  if not require("inkatze.plugins.packer").is_installed("nvim-notify") then
    return nil
  end
end

return notify
