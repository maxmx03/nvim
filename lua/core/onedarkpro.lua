local onedarkpro, colors = require('utils').get_theme()

onedarkpro.setup {
  options = {
    transparency = user.transparency,
    italic = true,
  },
  hlgroups = {
    NeoTreeDirectoryName = { fg = colors.fg },
    NeoTreeDirectoryIcon = { fg = colors.blue },
    NeoTreeRootName = {
      fg = colors.blue,
    },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeRootFolder = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
  },
}

onedarkpro.load()

vim.cmd(string.format('colorscheme %s', user.colorscheme))
