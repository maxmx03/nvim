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
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end

    if client:supports_method 'textDocument/completion' then
      require('blink.cmp').setup {
        keymap = {
          preset = 'enter',
        },
      }
    end

    if client:supports_method 'textDocument/codeLens' then
      vim.lsp.codelens.enable(true)
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = args.buf,
        callback = function()
          vim.lsp.codelens.enable(true)
        end,
      })
    end

    if
      not client:supports_method 'textDocument/willSaveWaitUntil'
      and client:supports_method 'textDocument/formatting'
    then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          -- vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
          vim.cmd 'Format'
        end,
      })
    end
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function(ev)
        local count = vim.diagnostic.count(ev.buf)
        if count[1] ~= nil then
          vim.lsp.buf.code_action {
            context = {
              only = { 'source.organizeImports', 'source.fixAll' },
              diagnostics = {},
            },
            apply = true,
          }
        end
      end,
    })
  end,
})
