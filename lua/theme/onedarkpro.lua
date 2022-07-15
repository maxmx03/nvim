local onedarkpro = require 'onedarkpro'
local colors = onedarkpro.get_colors(vim.g.onedarkpro_style)

onedarkpro.setup {
  options = {
    transparency = false,
    italic = true,
  },
  hlgroups = {
    NeoTreeDirectoryName = { fg = colors.fg },
    NeoTreeDirectoryIcon = { fg = colors.blue },
    NeoTreeRootName = { fg = colors.blue },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeRootFolder = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
  },
}

return colors
