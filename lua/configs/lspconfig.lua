vim.diagnostic.config {
  underline = true,
  severity_sort = true,
  virtual_text = {
    prefix = '',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    },
  },
}
local servers = { 'lua_ls', 'gopls', 'denols', 'ts_ls', 'emmet_ls', 'jsonls', 'jdtls' }
local capabilities = require('blink.cmp').get_lsp_capabilities()
for _, server in ipairs(servers) do
  local config = require('servers.' .. server)
  config.capabilities = capabilities
  vim.lsp.config(server, config)
end
local servers_default = {
  'astro',
  'bashls',
  'clangd',
  'cssls',
  'cssmodules_ls',
  'dockerls',
  'fish_lsp',
  'marksman',
  'tailwindcss',
  'vimls',
  'vue_ls',
  'html',
  'gradle_ls',
  'lemminx',
  'pyright',
}
for _, server in ipairs(servers_default) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
end
vim.list_extend(servers, servers_default)
require('mason').setup()
require('mason-lspconfig').setup {
  automatic_enable = servers,
  ensure_installed = servers,
}
vim.lsp.config('gdscript', {
  capabilities = capabilities,
})
vim.lsp.enable 'gdscript'
