local kanagawa = require 'kanagawa'
local colors = require 'kanagawa.colors'

local default_colors = colors.setup()

kanagawa.setup {
  transparent = false,
  undercurl = true,
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = false },
  variablebuiltinStyle = { italic = true },
  colors = {
    fg = default_colors.fujiWhite,
    bg = default_colors.sumiInk1,
    black = default_colors.sumiInk1,
    white = default_colors.fujiWhite,
    blue = default_colors.crystalBlue,
    green = default_colors.autumnGreen,
    orange = default_colors.surimiOrange,
    purple = default_colors.oniViolet,
    red = default_colors.autumnRed,
    gray = default_colors.fujiGray,
  },
  overrides = {
    NeoTreeDirectoryName = { fg = default_colors.fujiWhite },
    NeoTreeDirectoryIcon = { fg = default_colors.oniViolet },
    NeoTreeRootName = { fg = default_colors.oniViolet },
    NvimTreeFolderName = { fg = default_colors.fujiWhite },
    NvimTreeFolderIcon = { fg = default_colors.oniViolet },
    NvimTreeRootFolder = { fg = default_colors.oniViolet },
    NvimTreeOpenedFolderName = { fg = default_colors.oniViolet },
  },
}

return colors.setup()
