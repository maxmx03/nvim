-- --- Config and Plugins ---
---@type base46.config
vim.g.base46 = {
  colorscheme = 'darkplus',
  transparency = not vim.g.neovide,
}
require 'config.globals'
require 'config.commands'
require 'config.keymaps'
require 'config.options'
require 'config.neovide'
require 'config.autocmds'
require 'config.lazyrc'
