local opts = { silent = true }
vim.g.mapleader = ';'

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', opts)
vim.keymap.set('n', '<C-e>', '<C-u>', opts)
-- vim.keymap.set('i', '<c-space>', function()
--   vim.lsp.completion.get()
-- end)
vim.keymap.set('n', 'ss', '<cmd>vsplit<CR>', opts)
vim.keymap.set('n', 'sv', '<cmd>split<CR>', opts)
vim.keymap.set('n', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('t', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle position=float<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>Neotree buffers position=float<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float)
vim.keymap.set('n', 'll', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>p', vim.pack.update, opts)
vim.keymap.set('n', '<leader>pd', function()
  local unix = require 'lib.unix'
  local plugins, err = unix.ls('/site/pack/core/opt', 'data')
  if err ~= nil then
    vim.notify(err, vim.log.levels.ERROR)
    return
  end
  local remove = {}
  vim.ui.select(plugins, { prompt = 'select plugin to delete' }, function(plugin)
    table.insert(remove, plugin)
  end)
  vim.pack.del(remove)
end, opts)
vim.keymap.set('n', '<F1>', '<cmd>restart<CR>', opts)
vim.keymap.set({ 't' }, '<Esc>', function()
  require('floaterm.api').switch_wins()
end)
vim.api.nvim_create_user_command('LspLog', function()
  local log_path = vim.fs.joinpath(vim.fn.stdpath 'log', 'lsp.log')
  if vim.uv.fs_stat(log_path) then
    vim.cmd.edit(log_path)
  end
end, { desc = 'Abre o arquivo de log do LSP' })
