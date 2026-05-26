local builtin_plugs = {
  '2html_plugin',
  'tohtml',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
}
for _, plugin in ipairs(builtin_plugs) do
  vim.g['loaded_' .. plugin] = true
end
require 'lib.pack'
require 'options'
require 'keymaps'
local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'blink' and kind == 'install' then
    require('blink.cmp').build():wait(60000)
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })
vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/numToStr/Comment.nvim' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
  { src = 'https://github.com/nvimtools/hydra.nvim' },
  { src = 'https://github.com/nvzone/floaterm' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range '3',
  },
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/b0o/SchemaStore.nvim' },
  { src = 'https://github.com/maxmx03/modeline.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', name = 'blink', version = 'v1.9.1' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/OXY2DEV/markview.nvim' },
  { src = 'https://github.com/OXY2DEV/foldtext.nvim' },
  -- dependencies
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvzone/volt',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/maxmx03/base46',
}
require 'plugins.lspconfig'
require 'plugins.comment'
require 'plugins.autopairs'
require 'plugins.hydra'
require 'plugins.float-term'
require 'plugins.treesitter'
require 'plugins.telescope'
require 'plugins.neo-tree'
require 'plugins.conform'
require 'plugins.flash'
require 'plugins.gitsigns'
require 'plugins.todo-comments'
require 'plugins.markview'
require 'plugins.fold-text'
require 'plugins.base46'
