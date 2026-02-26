local languages = {
  'go',
  'c',
  'cpp',
  'javascript',
  'lua',
  'vim',
  'luadoc',
  'printf',
  'markdown',
  'markdown_inline',
  'todotxt',
  'make',
  'cmake',
  'diff',
  'sql',
  'vimdoc',
}
require('nvim-treesitter').install(languages)
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function()
    vim.treesitter.start()
  end,
})
