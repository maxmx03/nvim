local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', repo, '--branch=stable', lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy_config = require 'configs.lazy'
require 'options'
require 'autocmds'
require 'mappings'
require('lazy').setup({
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'configs.kanagawa'
    end,
  },
  { import = 'plugins' },
}, lazy_config)
