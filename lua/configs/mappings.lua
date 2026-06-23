local wk = require 'which-key'

wk.add {
  {
    '<leader>w',
    '<cmd>update<cr>',
    desc = 'save',
  },
  {
    '<leader>q',
    '<cmd>quit<cr>',
    desc = 'close',
  },
  {
    '<leader>e',
    '<cmd>Neotree toggle reveal position=float<cr>',
    desc = 'toggle neo-tree',
  },
  {
    '<leader>r',
    '<cmd>Neotree buffers reveal position=float<cr>',
    desc = 'toggle neo-tree',
  },
  {
    '<leader>f',
    '<cmd>Telescope find_files<cr>',
    desc = 'Format file',
  },
  {
    '<leader>l',
    group = 'LSP',
  },
  {
    '<leader>li',
    vim.lsp.buf.implementation,
  },
  {
    '<leader>ld',
    vim.lsp.buf.defition,
  },
  {
    '<leader>lh',
    vim.lsp.buf.hover,
  },
  {
    '<leader>la',
    vim.lsp.buf.code_action,
  },
  {
    '<leader>d',
    group = 'DIAGNOSTIC',
  },
  {
    '<leader>do',
    vim.diagnostic.open_float,
  },
  {
    '<leader>dl',
    vim.diagnostic.setloclist,
  },
  {
    '<leader>t',
    group = 'TELESCOPE',
  },
  {
    '<leader>tt',
    '<cmd>Telescope find_files<cr>',
    desc = 'Find file',
  },
  {
    '<leader>tg',
    '<cmd>Telescope live_grep<cr>',
    desc = 'Find code',
  },
  {
    '<leader>x',
    '<cmd>FloatermToggle<cr>',
    desc = 'Toggle Terminal',
  },
  {
    mode = 't',
    {
      '<leader>x',
      '<cmd>FloatermToggle<cr>',
      desc = 'Toggle Terminal',
    },
  },
}
