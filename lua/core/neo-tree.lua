local neotree = require 'neo-tree'
local set_autocmd = require('utils').set_autocmd

neotree.setup {
  event_handlers = {
    {
      event = 'file_opened',
      handler = function()
        neotree.close_all()
      end,
    },
  },
  window = {
    position = user.sidebar,
    mappings = {
      ['<space>'] = '',
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      default = '',
      highlight = 'NeoTreeFileIcon',
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = {
        'node_modules',
      },
    },
  },
}
