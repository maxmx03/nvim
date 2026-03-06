local color = require 'base46.color'
local blend = color.blend
local shade = color.shade
local background = '#0e1013'
local purple = '#bf68d9'
require('base46').setup {
  colorscheme = 'onedark',
  transparency = true,
  themes = { 'onedark', 'darkplus' },
  groups = {
    { name = 'StatusLineNC', val = { fg = shade('#a0a8b7', 3), bg = shade('#1f2329', 3) } },
    { name = '@lsp.type.modifier.java', val = { link = 'Keyword' } },
    { name = 'NeoTreeTitleBar', val = { bg = blend(purple, background, 0.3), fg = purple } },
  },
  plugins = {
    nvimtree = false,
    dashboard = false,
    dired = false,
    cmp = false,
    navic = false,
    bufferline = false,
    rainbow = false,
    flutterTools = false,
    supermaven = false,
    markview = false,
  },
}
