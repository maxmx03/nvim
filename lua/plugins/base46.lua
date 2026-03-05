local color = require 'base46.color'
local shade = color.shade
require('base46').setup {
  colorscheme = 'onedark',
  transparency = true,
  themes = { 'onedark', 'darkplus' },
  groups = {
    { name = 'StatusLineNC', val = { fg = shade('#a0a8b7', 3), bg = shade('#1f2329', 3) } },
    { name = '@lsp.type.modifier.java', val = { link = 'Keyword' } },
  },
}
