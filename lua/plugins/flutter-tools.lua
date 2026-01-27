return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  keys = {
    {
      '<leader>fo',
      '<cmd>FlutterOutlineToggle<cr>',
      desc = 'Flutter Outline',
    },
    {
      '<leader>fr',
      '<cmd>FlutterRun<cr>',
      desc = 'Flutter Run',
    },
    {
      '<leader>fR',
      '<cmd>FlutterRestart<cr>',
      desc = 'Flutter Restart',
    },
    {
      '<leader>fl',
      '<cmd>FlutterReload<cr>',
      desc = 'Flutter Reload',
    },
    {
      '<leader>fe',
      '<cmd>FlutterDevTools<cr>',
      desc = 'Flutter Emulators',
    },
    {
      '<leader>fd',
      '<cmd>FlutterDevices<cr>',
      desc = 'Flutter Devices',
    },
  },
  config = function()
    require('flutter-tools').setup {
      widget_guides = {
        enabled = true,
      },
    }
  end,
}
