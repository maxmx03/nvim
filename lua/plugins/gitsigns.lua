require('gitsigns').setup {
  current_line_blame = true,
  word_diff = false,
  signs = {
    delete = { text = '󰍵' },
    changedelete = { text = '󱕖' },
  },
  signs_staged = {
    add = { text = '+' },
    change = { text = '┃' },
    delete = { text = '-' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
}
