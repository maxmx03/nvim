local telescope = require 'telescope'

telescope.setup {
  defaults = {
    prompt_prefix = '   ',
    selection_caret = ' ',
    entry_prefix = ' ',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
  },
}
telescope.load_extension 'themes'
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = 'Telescope themes' })
