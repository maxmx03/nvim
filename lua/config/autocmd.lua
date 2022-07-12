vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  callback = function()
    vim.cmd 'update'
  end,
})
