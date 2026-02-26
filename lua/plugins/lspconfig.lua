vim.diagnostic.config {
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
local servers = { 'lua_ls', 'gopls' }
for _, server in ipairs(servers) do
  vim.lsp.config(server, require('servers.' .. server))
end
require('mason').setup()
require('mason-lspconfig').setup {
  automatic_enable = servers,
  ensure_installed = servers,
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method 'textDocument/implementation' then
      vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation)
    end

    if client:supports_method 'textDocument/definition' then
      vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
    end

    if client:supports_method 'textDocument/hover' then
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
    end

    if client:supports_method 'textDocument/codeAction' then
      vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action)
    end

    if client:supports_method 'textDocument/diagnostic' then
      vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist)
    end

    if client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end

    if client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
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
  end,
})
