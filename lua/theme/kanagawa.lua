local kanagawa = require 'kanagawa'
local colors = require 'kanagawa.colors'

local default_colors = colors.setup()
local transparent = false

kanagawa.setup {
  transparent = transparent,
  undercurl = true,
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = false },
  variablebuiltinStyle = { italic = true },
  colors = {
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
    VertSplit = { bg = 'NONE', fg = not transparent and default_colors.sumiInk0 or default_colors.fujiGray },

    NvimTreeNormal = { fg = default_colors.fujiWhite, bg = transparent and 'NONE' or default_colors.sumiInk0 },
    NvimTreeNormalNC = { link = 'NvimTreeNormal' },
    NvimTreeEndOfBuffer = { fg = default_colors.sumiInk0 },
    NvimTreeFolderName = { fg = default_colors.fujiWhite },
    NvimTreeFolderIcon = { fg = default_colors.oniViolet },
    NvimTreeRootFolder = { fg = default_colors.oniViolet },
    NvimTreeOpenedFolderName = { fg = default_colors.oniViolet },

    NeoTreeDirectoryName = { fg = default_colors.fujiWhite },
    NeoTreeDirectoryIcon = { fg = default_colors.oniViolet },
    NeoTreeRootName = { fg = default_colors.oniViolet },

    TelescopePreviewTitle = {
      fg = default_colors.sumiInk1,
      bg = not transparent and default_colors.oniViolet or default_colors.fujiWhite,
    },
    TelescopeResultsTitle = {
      fg = default_colors.sumiInk1,
      bg = not transparent and default_colors.oniViolet or default_colors.fujiWhite,
    },
    TelescopePromptTitle = {
      fg = default_colors.sumiInk1,
      bg = not transparent and default_colors.oniViolet or default_colors.fujiWhite,
    },
    TelescopeNormal = { bg = not transparent and default_colors.sumiInk1 or 'NONE' },
    TelescopeBorder = {
      fg = not transparent and default_colors.oniViolet or default_colors.fujiGray,
      bg = not transparent and default_colors.sumiInk1 or 'NONE',
    },
    TelescopePromptNormal = {
      fg = default_colors.fujiWhite,
      bg = not transparent and default_colors.sumiInk1 or 'NONE',
    },
    TelescopePromptBorder = {
      fg = not transparent and default_colors.oniViolet or default_colors.fujiGray,
      bg = not transparent and default_colors.sumiInk1 or 'NONE',
    },
    TelescopeSelection = {
      fg = default_colors.boatYellow2,
    },
    TelescopeMatching = {
      fg = default_colors.carpYellow,
    },
  },
}

return colors.setup()
