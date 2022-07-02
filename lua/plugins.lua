require 'bootstrap'
local success, packer = pcall(require, 'packer')

if not success then
  return
end

packer.startup {
  function(use)
    use {
      'olimorris/onedarkpro.nvim',
      'wbthomason/packer.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'tami5/lspsaga.nvim',
      'ray-x/lsp_signature.nvim',
      'windwp/nvim-ts-autotag',
      'windwp/nvim-autopairs',
      'norcalli/nvim-colorizer.lua',
      'lukas-reineke/indent-blankline.nvim',
      'lewis6991/impatient.nvim',
      'folke/lua-dev.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
      'numToStr/Comment.nvim',
      'SmiteshP/nvim-gps',
      'phaazon/hop.nvim',
      'glepnir/dashboard-nvim',
      'j-hui/fidget.nvim',
      {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
          'MunifTanjim/nui.nvim',
        },
      },
      {
        'kdheepak/tabline.nvim',
        requires = {
          'hoob3rt/lualine.nvim',
          'kyazdani42/nvim-web-devicons',
        },
      },
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
      },
      {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
      },
      {
        'hrsh7th/nvim-cmp',
        requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'saadparwaiz1/cmp_luasnip',
          'L3MON4D3/LuaSnip',
          'rafamadriz/friendly-snippets',
          'onsails/lspkind-nvim',
        },
      },
    }

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
