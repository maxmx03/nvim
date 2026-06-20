local opts = { silent = true }
local map = vim.keymap.set
map('n', 'ss', '<cmd>split<cr>', opts)
map('n', 'sv', '<cmd>vsplit<cr>', opts)
map('n', '+', '<c-a>', opts)
map('n', '-', '<c-x>', opts)
map('n', '<M-left>', '<cmd>BufferLineCyclePrev<cr>', opts)
map('n', '<M-right>', '<cmd>BufferLineCycleNext<cr>', opts)
map('n', '<M-up>', '<cmd>BufferLinePick<cr>', opts)
map('n', '<M-down>', '<cmd>bd<cr>', opts)
map('n', '<C-Right>', '<C-w>l')
map('n', '<C-Up>', '<C-w>k')
map('n', '<C-Left>', '<C-w>h')
map('n', '<C-Down>', '<C-w>j')
map('n', '<F3>', function()
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
map({ 't' }, '<Esc>', function()
  require('floaterm.api').switch_wins()
end)
