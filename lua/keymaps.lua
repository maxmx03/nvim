local opts = { silent = true }
vim.g.mapleader = ';'

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', opts)
vim.keymap.set('n', '<C-e>', '<C-u>', opts)
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)
vim.keymap.set('n', 'ss', '<cmd>vsplit<CR>', opts)
vim.keymap.set('n', 'sv', '<cmd>split<CR>', opts)
vim.keymap.set('n', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('t', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('n', '<leader>p', vim.pack.update, opts)
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle position=float<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>Neotree buffers position=float<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>')
