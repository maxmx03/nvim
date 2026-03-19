local color = require 'base46.color'
local blend = color.blend
local shade = color.shade
require('base46').setup {
  colorscheme = 'carbonfox',
  transparency = false,
  themes = { 'carbonfox' },
  groups = {
    { name = 'StatusLineNC', val = { fg = shade('#dde1e6', 3), bg = shade('#202020', 3) } },
    { name = '@lsp.type.modifier.java', val = { link = 'Keyword' } },
    { name = 'NeoTreeTitleBar', val = { bg = blend('#3ddbd9', '#0f0f0f', 0.3), fg = '#3ddbd9' } },
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
  },
}
