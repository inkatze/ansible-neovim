local fidget = {}

function fidget.config()
  if not require("inkatze.plugins.packer").is_installed("fidget.nvim") then
    return nil
  end

  require("fidget").setup({
    window = {
      blend = 0,
    },
  })
end

return fidget
