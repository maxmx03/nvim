local flash = require 'flash'
flash.setup {}
vim.keymap.set('n', '<c-s>', flash.remote)
