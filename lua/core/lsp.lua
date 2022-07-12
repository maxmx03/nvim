local lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<space>l', vim.lsp.buf.format, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local config = {
  on_attach = on_attach,
  flags = {
    debouce_text_changes = 150,
  },
  capabilities = capabilities,
}

for _, server in pairs(user.servers) do
  if server == 'sumneko_lua' then
    local luadev = require 'lua-dev'

    config = luadev.setup {
      library = {
        vimruntime = true,
        types = true,
        plugins = true,
      },
      runtime_path = false,
      lspconfig = {
        on_attach = on_attach,
        flags = {
          debouce_text_changes = 150,
        },
        capabilities = capabilities,
      },
    }
  end

  lsp[server].setup(config)
end

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

vim.diagnostic.config {
  virtual_text = {
    prefix = '',
  },
}
