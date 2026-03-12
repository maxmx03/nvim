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
  'scss',
  'css',
  'typescript',
  'tsx',
  'json',
  'bash',
  'fish',
  'java',
  'html',
  'latex',
  'comment',
  'typst',
  'meson',
}
require('nvim-treesitter').install(languages)
table.insert(languages, 'typescriptreact')
table.insert(languages, 'jsonc')
table.insert(languages, 'sh')
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function()
    vim.treesitter.start()
  end,
})
