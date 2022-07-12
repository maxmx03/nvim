local opts = { noremap = true, silent = true }

-- QUIT
vim.keymap.set('n', '<space>q', ':quit<cr>', opts)

-- QUIT NEOVIM
vim.keymap.set('n', '<F3>', ':quitall<cr>', opts)

-- OPEN DASHBOARD
vim.keymap.set('n', '<F2>', ':Dashboard<cr>', opts)

-- NEO-TREE
vim.keymap.set('n', '<space>e', ':NvimTreeToggle<cr>', opts)

-- TELESCOPE
vim.keymap.set('n', '<space>ff', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<space>fg', ':Telescope live_grep<cr>', opts)

-- TABLINE
vim.keymap.set('n', '<C-Right>', ':TablineBufferNext<cr>', opts)
vim.keymap.set('n', '<C-Left>', ':TablineBufferPrevious<cr>', opts)
vim.keymap.set('n', '<C-x>', ':bd<cr>')

-- PACKER
vim.keymap.set('n', '<space>pp', ':PackerSync<cr>', opts)

-- GIT
vim.keymap.set('n', '<space>gd', ':DiffviewOpen<cr>', opts)
vim.keymap.set('n', '<space>gc', ':DiffviewClose<cr>', opts)

-- LSPSAGA
vim.keymap.set('n', '<space>sr', ':Lspsaga rename<cr>', opts)
vim.keymap.set('n', '<space>sa', ':Lspsaga code_action<cr>', opts)
vim.keymap.set('n', '<space>sk', ':Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', '<space>sh', ':Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', '<space>sd', ':Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', '<space>sl', ':Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set('n', '<space>sf', ':Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', '<space>t', ':Lspsaga open_floaterm fish<cr>', opts)
vim.keymap.set('t', '<space>x', '<C-\\><C-n>:Lspsaga close_floaterm<cr>', opts)

-- HOP
vim.keymap.set('n', 's', ':HopPattern<cr>', opts)
vim.keymap.set('n', 'f', ':HopWord<cr>', opts)

-- COMMENT
vim.keymap.set(
  'n',
  '<space>cc',
  "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
  { expr = true, remap = true }
)
vim.keymap.set('x', '<space>cc', '<Plug>(comment_toggle_linewise_visual)')
