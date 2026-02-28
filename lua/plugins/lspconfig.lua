vim.diagnostic.config {
  underline = true,
  severity_sort = true,
  virtual_text = false,
  signs = false,
  -- virtual_text = {
  --   prefix = '',
  -- },
  -- signs = {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = ' ',
  --     [vim.diagnostic.severity.WARN] = ' ',
  --     [vim.diagnostic.severity.INFO] = ' ',
  --     [vim.diagnostic.severity.HINT] = ' ',
  --   },
  -- },
}
local servers = { 'lua_ls', 'gopls', 'denols', 'ts_ls', 'emmet_ls', 'jsonls' }
for _, server in ipairs(servers) do
  vim.lsp.config(server, require('servers.' .. server))
end
vim.list_extend(servers, {
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
})
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
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation)
    end

    if client:supports_method 'textDocument/definition' then
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
    end

    if client:supports_method 'textDocument/hover' then
      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)
    end

    if client:supports_method 'textDocument/codeAction' then
      vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action)
    end

    if client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end

    if client:supports_method 'textDocument/completion' then
      ---@param item lsp.CompletionItem
      ---@return table
      local function convert(item)
        local icons = {
          [1] = '󰉿', -- Text
          [2] = '', -- Method
          [3] = '', -- Function
          [4] = '', -- Constructor
          [5] = '', -- Field
          [6] = '', -- Variable
          [7] = '', -- Class
          [8] = '', -- Interface
          [9] = '', -- Module
          [10] = '', -- Property
          [11] = '', -- Unit
          [12] = '', -- Value
          [13] = '', -- Enum
          [14] = '', -- Keyword
          [15] = '', -- Snippet
          [16] = '', -- Color
          [17] = '', -- File
          [18] = '', -- Reference
          [19] = '', -- Folder
          [20] = '', -- EnumMember
          [21] = '', -- Constant
          [22] = '', -- Struct
          [23] = '', -- Event
          [24] = '', -- Operator
          [25] = '', -- TypeParameter
        }
        local kind_hl = {
          [1] = 'String', -- Text
          [2] = 'Function', -- Method
          [3] = 'Function', -- Function
          [4] = 'Function', -- Constructor
          [5] = 'Identifier', -- Field
          [6] = 'Identifier', -- Variable
          [7] = 'Type', -- Class
          [8] = 'Type', -- Interface
          [9] = 'Type', -- Module
          [10] = 'Identifier', -- Property
          [11] = 'Number', -- Unit
          [12] = 'Number', -- Value
          [13] = 'Number', -- Enum
          [14] = 'Keyword', -- Keyword
          [15] = 'Function', -- Snippet
          [16] = 'String', -- Color
          [17] = 'String', -- File
          [18] = 'String', -- Reference
          [19] = 'Directory', -- Folder
          [20] = 'Number', -- EnumMember
          [21] = 'Constant', -- Constant
          [22] = 'Structure', -- Struct
          [23] = 'Function', -- Event
          [24] = 'Operator', -- Operator
          [25] = 'Type', -- TypeParameter
        }
        return {
          word = item.label,
          kind = icons[item.kind],
          kind_hlgroup = kind_hl[item.kind],
        }
      end

      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
        convert = convert,
      })
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
