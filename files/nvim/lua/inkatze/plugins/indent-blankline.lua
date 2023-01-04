local ibl = {}

function ibl.config()
  if require("inkatze.plugins.packer").is_installed("indent-blankline.nvim") then
    return nil
  end

  require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  })
end

return ibl
