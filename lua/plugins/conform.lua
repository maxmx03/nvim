local conform = require 'conform'
local prettier = { 'prettierd', 'prettier' }
conform.setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    mdx = prettier,
    markdown = prettier,
    css = prettier,
    scss = prettier,
    html = prettier,
    yaml = prettier,
    sh = { 'shfmt' },
    gdscript = { 'gdscript-formatter' },
  },
  c = { lsp_format = 'prefer' },
  cpp = { lsp_format = 'prefer' },
  default_format_opts = {
    lsp_format = 'fallback',
    stop_after_first = true,
  },
  format_on_save = {
    timeout_ms = 500,
    stop_after_first = true,
    lsp_format = 'fallback',
  },
}
vim.api.nvim_create_user_command('Format', function()
  conform.format {}
end, {})

require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
    'prettier',
    'prettierd',
    'shfmt',
    'gdscript-formatter',
  },
}
