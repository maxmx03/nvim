require('kanagawa').setup {
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true,
  dimInactive = false,
  terminalColors = true,
  theme = 'wave',
  background = {
    dark = 'wave',
    light = 'lotus',
  },
}
vim.cmd.colorscheme 'kanagawa'
