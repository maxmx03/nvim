require('foldtext').setup {
  -- Ignore buffers with these buftypes.
  ignore_buftypes = {},
  -- Ignore buffers with these filetypes.
  ignore_filetypes = {},
  -- Ignore buffers/windows if the result
  -- is false.
  condition = function()
    return true
  end,

  styles = {
    default = {
      { kind = 'bufline' },
    },

    -- Custom foldtext.
    custom_a = {
      -- Only on these filetypes.
      filetypes = {},
      -- Only on these buftypes.
      buftypes = {},

      -- Only if this condition is
      -- true.
      condition = function(win)
        return vim.wo[win].foldmethod == 'manual'
      end,

      -- Parts to create the foldtext.
      parts = {
        { kind = 'fold_size' },
      },
    },
  },
}
