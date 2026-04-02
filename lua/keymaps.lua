local opts = { silent = true }
vim.g.mapleader = ';'

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', opts)
vim.keymap.set('n', '<C-e>', '<C-u>', opts)
vim.keymap.set('n', 'ss', '<cmd>vsplit<CR>', opts)
vim.keymap.set('n', 'sv', '<cmd>split<CR>', opts)
vim.keymap.set('n', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('t', '<leader>x', '<cmd>FloatermToggle<CR>', opts)
vim.keymap.set('n', '<F3>', function()
  local contents = vim.fn.readfile 'meson.build'
  for _, content in ipairs(contents) do
    local executable = content:match 'executable%s*%(%s*[\'"](.-)[\'"]'
    if executable ~= nil then
      require('floaterm.api').send_cmd {
        cmd = 'meson compile -j4 -C build/ && ' .. string.format('./build/%s', executable),
      }
      return
    end
  end
end, opts)
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle reveal position=float<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>Neotree buffers position=float<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<leader>p', vim.pack.update, opts)
vim.keymap.set('n', '<leader>pd', vim.pack.plugins, opts)
vim.keymap.set('n', '<F1>', '<cmd>restart<CR>', opts)
vim.keymap.set({ 't' }, '<Esc>', function()
  require('floaterm.api').switch_wins()
end)
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float)
vim.keymap.set('n', 'll', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
vim.api.nvim_create_user_command('LspLog', function()
  local log_path = vim.fs.joinpath(vim.fn.stdpath 'log', 'lsp.log')
  if vim.uv.fs_stat(log_path) then
    vim.cmd.edit(log_path)
  end
end, { desc = 'Abre o arquivo de log do LSP' })
vim.keymap.set('n', '<M-Up>', '<cmd>BufferPick<CR>', opts)
vim.keymap.set('n', '<M-Right>', '<cmd>bnext<CR>', opts)
vim.keymap.set('n', '<M-Left>', '<cmd>bprevious<CR>', opts)
vim.keymap.set('n', '<M-Down>', '<cmd>bdelete<CR>', opts)
