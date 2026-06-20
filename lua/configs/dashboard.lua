local neovim_version = function()
  local version = vim.version()
  if vim.g.neovide then
    return string.format(
      'Neovim v%s.%s.%s Neovide v%s',
      version.major,
      version.minor,
      version.patch,
      vim.g.neovide_version
    )
  end
  return string.format('Version: v%s.%s.%s', version.major, version.minor, version.patch)
end
local plugins = function()
  local stats = require('lazy').stats()
  return '  Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins'
end
local header = function()
  local ascii = require 'lib.ascii'
  math.randomseed(os.time())
  local val = ascii[math.random(#ascii)]
  local emmptyLine = string.rep(' ', vim.fn.strwidth(val[1]))
  table.insert(val, 1, emmptyLine)
  table.insert(val, 2, emmptyLine)
  val[#val + 1] = emmptyLine
  val[#val + 1] = emmptyLine
  return val
end
require('dashboard').setup {
  theme = 'doom',
  config = {
    header = header(),
    center = {
      {
        icon = ' ',
        desc = 'Find Files',
        key = 't',
        keymap = vim.g.mapleader .. ' t t',
        action = 'Telescope find_files',
      },
      {
        icon = ' ',
        desc = 'File explorer',
        key = 'e',
        keymap = vim.g.mapleader .. ' e',
        action = ':Neotree toggle reveal position=float',
      },
      {
        icon = ' ',
        desc = 'Configuration',
        key = 'c',
        -- keymap = 'SPC c',
        action = 'lua vim.cmd(string.format("edit %s", vim.fn.stdpath("config")))',
      },
      {
        icon = '󰩈 ',
        desc = 'Quit',
        key = 'q',
        keymap = vim.g.mapleader .. ' q',
        action = 'quit',
      },
    },
    footer = { neovim_version(), plugins() },
  },
}
