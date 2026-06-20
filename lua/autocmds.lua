vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
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
          vim.cmd.Format()
        end,
      })
    end
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function(ev)
        local errors = vim.diagnostic.count(ev.buf)
        if not vim.tbl_isempty(errors) then
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
