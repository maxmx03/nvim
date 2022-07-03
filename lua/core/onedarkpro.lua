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
  },
}

onedarkpro.load()

vim.cmd(string.format('colorscheme %s', user.colorscheme))
