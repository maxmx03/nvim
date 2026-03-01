local flash = require 'flash'
vim.keymap.set('n', 'f', function()
  flash.remote()
end)
vim.keymap.set('n', 't', function()
  flash.remote()
end)
vim.keymap.set('n', '<S-t>', function()
  flash.remote {
    search = { forward = true },
  }
end)
vim.keymap.set('n', '<S-f>', function()
  flash.remote {
    search = { forward = true },
  }
end)
