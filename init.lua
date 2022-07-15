--{{{ PACKER BOOTSTRAP
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
vim.o.runtimepath = vim.fn.stdpath 'data' .. '/site/pack/*/start/*,' .. vim.o.runtimepath

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end
--}}}

--{{{ PACKER PLUGINS
local success, packer = pcall(require, 'packer')

if not success then
  return
end

packer.startup {
  function(use)
    use {
      'olimorris/onedarkpro.nvim',
      'rebelot/kanagawa.nvim',
      'wbthomason/packer.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
      'windwp/nvim-ts-autotag',
      'windwp/nvim-autopairs',
      'norcalli/nvim-colorizer.lua',
      'lukas-reineke/indent-blankline.nvim',
      'lewis6991/impatient.nvim',
      'folke/lua-dev.nvim',
      'sindrets/diffview.nvim',
      'numToStr/Comment.nvim',
      'phaazon/hop.nvim',
      'glepnir/dashboard-nvim',
      'j-hui/fidget.nvim',
      'SmiteshP/nvim-gps',
      {
        'glepnir/lspsaga.nvim',
        requires = 'neovim/nvim-lspconfig',
      },
      {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
      },
      {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
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
  augroup packer_ide_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
--}}}

--{{{ PLUGIN IMPATIENT
success = pcall(require, 'impatient')

if not success then
  vim.cmd 'colorscheme slate'
  return
end
--}}}

--{{{ IDE TABLE
local ide = {}
ide.sidebar = 'left'
ide.colorscheme = 'kanagawa'
ide.formattings = {
  'prettier',
  'stylua',
}
ide.diagnostics = {
  'eslint',
}
ide.completions = {
  'spell',
}
ide.code_actions = {
  'eslint',
}
ide.hovers = {}
ide.langs = {
  'bash',
  'c',
  'c_sharp',
  'cpp',
  'css',
  'dart',
  'fish',
  'go',
  'graphql',
  'html',
  'java',
  'javascript',
  'json',
  'kotlin',
  'lua',
  'php',
  'prisma',
  'python',
  'regex',
  'scss',
  'svelte',
  'tsx',
  'typescript',
  'toml',
  'vim',
  'vue',
  'yaml',
}
ide.servers = {
  'pylsp',
  'tsserver',
  'sumneko_lua',
  'prismals',
  'graphql',
  'cssls',
  'html',
  'vuels',
  'volar',
  'emmet_ls',
  'tailwindcss',
  'svelte',
}
---}}}

--{{{ IDE OPTIONS
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.updatetime = 300
vim.opt.pumheight = 20
vim.opt.foldmethod = 'marker'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'cache' .. '/undo'
vim.opt.clipboard = 'unnamedplus'
vim.opt.whichwrap:append '<,>,[,],h,l'
vim.o.termguicolors = true
vim.g.python3_host_prog = '/usr/bin/python3.10'

vim.cmd [[
  if has('python')
    set pyx=2
  elseif has('python3') 
    set pyx=3
  endif
]]
--}}}

--{{{ IDE AUTOCMD
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  callback = function()
    vim.cmd 'update'
  end,
})
--}}}

--{{{ IDE MAPPINGS
local opts = { noremap = true, silent = true }

-- SAVE BUFFER
vim.keymap.set('n', '<space>w', ':update<cr>', opts)

-- QUIT
vim.keymap.set('n', '<space>q', ':quit<cr>', opts)

-- QUIT NEOVIM
vim.keymap.set('n', '<F3>', ':quitall<cr>', opts)

-- OPEN DASHBOARD
vim.keymap.set('n', '<F2>', ':Dashboard<cr>', opts)

-- NEO-TREE
vim.keymap.set('n', '<space>e', ':NvimTreeToggle<cr>', opts)

-- TELESCOPE
vim.keymap.set('n', '<space>ff', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<space>fg', ':Telescope live_grep<cr>', opts)

-- TABLINE
vim.keymap.set('n', '<C-Right>', ':TablineBufferNext<cr>', opts)
vim.keymap.set('n', '<C-Left>', ':TablineBufferPrevious<cr>', opts)
vim.keymap.set('n', '<C-x>', ':bd<cr>')

-- PACKER
vim.keymap.set('n', '<space>pp', ':PackerSync<cr>', opts)

-- GIT
vim.keymap.set('n', '<space>gd', ':DiffviewOpen<cr>', opts)
vim.keymap.set('n', '<space>gc', ':DiffviewClose<cr>', opts)

-- LSPSAGA
vim.keymap.set('n', '<space>sr', ':Lspsaga rename<cr>', opts)
vim.keymap.set('n', '<space>sa', ':Lspsaga code_action<cr>', opts)
vim.keymap.set('n', '<space>sk', ':Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', '<space>sh', ':Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', '<space>sd', ':Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', '<space>sl', ':Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set('n', '<space>sf', ':Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', '<space>t', ':Lspsaga open_floaterm fish<cr>', opts)
vim.keymap.set('t', '<space>x', '<C-\\><C-n>:Lspsaga close_floaterm<cr>', opts)

-- HOP
vim.keymap.set('n', 's', ':HopPattern<cr>', opts)
vim.keymap.set('n', 'f', ':HopWord<cr>', opts)

-- COMMENT
vim.keymap.set(
  'n',
  '<space>cc',
  "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
  { expr = true, remap = true }
)
vim.keymap.set('x', '<space>cc', '<Plug>(comment_toggle_linewise_visual)')

--}}}

--{{{ PLUGIN NULL-LS
local null_ls = require 'null-ls'

local function map(builtins, sources, callback)
  if sources then
    for _, source in ipairs(sources) do
      callback(builtins[source])
    end
  end
end

local function sources(opts)
  local s = {}

  map(null_ls.builtins.formatting, opts.formattings, function(source)
    table.insert(s, source)
  end)

  map(null_ls.builtins.diagnostics, opts.diagnostics, function(source)
    table.insert(s, source)
  end)

  map(null_ls.builtins.completion, opts.completions, function(source)
    table.insert(s, source)
  end)

  map(null_ls.builtins.code_actions, opts.code_actions, function(source)
    table.insert(s, source)
  end)

  map(null_ls.builtins.hover, opts.hovers, function(source)
    table.insert(s, source)
  end)

  return s
end

null_ls.setup {
  debug = false,
  sources = sources {
    formattings = ide.formattings,
    diagnostics = ide.diagnostics,
    completions = ide.completions,
    code_actions = ide.code_actions,
    hovers = ide.hovers,
  },
}
--}}}

--{{{ PLUGIN CMP
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require 'lspkind'

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = false },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
    },
  },
}

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
--}}}

--{{{ PLUGIN LSP SIGNATURE
local lsp_signature = require 'lsp_signature'

lsp_signature.setup {
  hint_prefix = '🤔️ ',
  floating_window = false,
}
--}}}

--{{{ PLUGIN LSP SAGA
local saga = require 'lspsaga'

saga.init_lsp_saga()
--}}}

--{{{ PLUGIN LSP INSTALLER
local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.setup {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
}
--}}}

--{{{ PLUGIN LSPCONFIG
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

for _, server in pairs(ide.servers) do
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
--}}}

--{{{ PLUGIN NVIM WEB DEVICONS
local devicons = require 'nvim-web-devicons'

local function icon_config(icon, color, name)
  return {
    icon = icon,
    color = color,
    name = name,
  }
end

-- custom icons
local git_icon = ''
local test_icon = ''
local angular_icon = ''

-- custom colors
local git_color = '#C84b31'
local ruby_color = '#FC4F4F'
local gem_color = '#FA4EAB'
local rubocop_color = '#C0C0C0'

-- default icons
local ruby_icon = devicons.get_icon_color('index.rb', 'rb')

-- default colors
local _, js_color = devicons.get_icon_color('index.js', 'js')
local _, ts_color = devicons.get_icon_color('index.ts', 'ts')
local _, html_color = devicons.get_icon_color('index.html', 'html')
local _, css_color = devicons.get_icon_color('index.css', 'css')

devicons.set_icon {
  -- git
  ['.gitignore'] = icon_config(git_icon, git_color, 'git'),
  ['.gitkeep'] = icon_config(git_icon, git_color, 'git'),

  -- ruby
  rb = icon_config(ruby_icon, ruby_color, 'ruby'),
  ['config.ru'] = icon_config(ruby_icon, ruby_color, 'ruby'),
  ['Gemfile'] = icon_config(ruby_icon, gem_color, 'ruby'),
  ['.rubocop.yml'] = icon_config(ruby_icon, rubocop_color, 'yaml'),

  -- test
  ['spec.js'] = icon_config(test_icon, js_color, 'javascript'),
  ['spec.jsx'] = icon_config(test_icon, js_color, 'javascriptreact'),
  ['spec.ts'] = icon_config(test_icon, ts_color, 'typescript'),
  ['spec.tsx'] = icon_config(test_icon, ts_color, 'typescriptreact'),
  ['test.js'] = icon_config(test_icon, js_color, 'javascript'),
  ['test.jsx'] = icon_config(test_icon, js_color, 'javascriptreact'),
  ['test.ts'] = icon_config(test_icon, ts_color, 'typescript'),
  ['test.tsx'] = icon_config(test_icon, ts_color, 'typescriptreact'),

  -- angular
  ['component.html'] = icon_config(angular_icon, html_color, 'html'),
  ['component.ts'] = icon_config(angular_icon, ts_color, 'typescript'),
  ['component.css'] = icon_config(angular_icon, css_color, 'css'),
  ['module.ts'] = icon_config(angular_icon, ts_color, 'typescript'),
  ['service.ts'] = icon_config(angular_icon, ts_color, 'typescript'),
}

devicons.setup()
--}}}

--{{{ PLUGIN TREESITTER
local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = ide.langs,
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
--}}}

--{{{ PLUGIN NVIM TREE
local nvim_tree = require 'nvim-tree'

nvim_tree.setup {
  view = {
    adaptive_size = true,
    side = ide.sidebar,
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$', 'node_modules' },
    exclude = {},
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
}
--}}}

--{{{ PLUGIN TELESCOPE
local telescope = require 'telescope'

telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', '.next', 'build', 'dist', 'android', 'ios' },
    prompt_prefix = ' ',
  },
}
--}}}

--{{{ PLUGIN LUALINE
local colors = require('theme.' .. ide.colorscheme)

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.purple },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.white, bg = colors.gray },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.bg } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg '/'
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', color = { fg = colors.black, bg = colors.green } },
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.black } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.black } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = { search_result, 'filetype' },
    lualine_y = {
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= 'null-ls' then
              return client.name
            end
          end
          return msg
        end,
        color = { fg = colors.fg, bg = colors.gray },
      },
    },
    lualine_z = { '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
--}}}

--{{{ PLUGIN TABLINE
local tabline = require 'tabline'

tabline.setup()
--}}}

--{{{ PLUGIN AUTOTAG
local autotag = require 'nvim-ts-autotag'

autotag.setup()
--}}}

--{{{ PLUGIN AUTOPAIRS
local autopairs = require 'nvim-autopairs'

autopairs.setup()
--}}}

--{{{ PLUGIN COLORIZER
local colorizer = require 'colorizer'

colorizer.setup()
--}}}

--{{{ PLUGIN DIFFVIEW
local diffview = require 'diffview'

diffview.setup()
--}}}

--{{{ PLUGIN INDENT BLANKLINE
local indent = require 'indent_blankline'

indent.setup {
  char = '▏',
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  filetype_exclude = { 'dashboard' },
}
--}}}

--{{{ PLUGIN COMMENT
local comment = require 'Comment'

comment.setup()
--}}}

--{{{ PLUGIN HOP
local hop = require 'hop'

hop.setup()
--}}}

--{{{ PLUGIN DASHBOARD
local dashboard = require 'dashboard'

dashboard.custom_header = {
  [[      ___           ___           ___                                    ___     ]],
  [[     /__/\         /  /\         /  /\          ___        ___          /__/\    ]],
  [[     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ]],
  [[      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ]],
  [[  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ]],
  [[ /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
  [[ \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
  [[  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ]],
  [[   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ]],
  [[    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ]],
  [[     \__\/         \__\/         \__\/           ~~~~                   \__\/    ]],
  [[                                                                                 ]],
  [[                                                                                 ]],
  [[                                                                                 ]],
}

dashboard.custom_center = {
  {
    icon = '  ',
    desc = 'File Browser                            ',
    action = 'NvimTreeToggle',
    shortcut = 'SPC e  ',
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f',
  },
  {
    icon = '  ',
    desc = 'Find  Word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g',
  },
  {
    icon = '  ',
    desc = 'Exit                                    ',
    action = 'qa',
    shortcut = 'SPC q  ',
  },
}

local neovim_welcome = '🎉 Have fun with neovim'
local neovim_info = ''
    .. 'Neovim  v'
    .. vim.version().major
    .. '.'
    .. vim.version().minor
    .. '.'
    .. vim.version().patch
    .. '   '
    .. os.date '%d/%m/%Y'

dashboard.custom_footer = { neovim_welcome, neovim_info }
--}}}

--{{{ PLUGIN FIDGET
local fidget = require 'fidget'

fidget.setup {
  window = {
    blend = 0,
  },
}
--}}}

--{{{ PLUGIN WINBAR
local gps = require 'nvim-gps'

local icons = {
  kind = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
  },
  type = {
    Array = '',
    Number = '',
    String = '',
    Boolean = '蘒',
    Object = '',
  },
  documents = {
    File = '',
    Files = '',
    Folder = '',
    OpenFolder = '',
  },
  git = {
    Add = '',
    Mod = '',
    Remove = '',
    Ignore = '',
    Rename = '',
    Diff = '',
    Repo = '',
  },
  ui = {
    Lock = '',
    Circle = '',
    BigCircle = '',
    BigUnfilledCircle = '',
    Close = '',
    NewFile = '',
    Search = '',
    Lightbulb = '',
    Project = '',
    Dashboard = '',
    History = '',
    Comment = '',
    Bug = '',
    Code = '',
    Telescope = '',
    Gear = '',
    Package = '',
    List = '',
    SignIn = '',
    Check = '',
    Fire = '',
    Note = '',
    BookMark = '',
    Pencil = '',
    -- ChevronRight = '',
    ChevronRight = '>',
    Table = '',
    Calendar = '',
  },
  diagnostics = {
    Error = '',
    Warning = '',
    Information = '',
    Question = '',
    Hint = '',
  },
  misc = {
    Robot = 'ﮧ',
    Squirrel = '',
    Tag = '',
    Watch = '',
  },
}

gps.setup {
  icons = {
    ['class-name'] = '%#CmpItemKindClass#' .. icons.kind.Class .. '%*' .. ' ', -- Classes and class-like objects
    ['function-name'] = '%#CmpItemKindFunction#' .. icons.kind.Function .. '%*' .. ' ', -- Functions
    ['method-name'] = '%#CmpItemKindMethod#' .. icons.kind.Method .. '%*' .. ' ', -- Methods (functions inside class-like objects)
    ['container-name'] = '%#CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ', -- Containers (example: lua tables)
    ['tag-name'] = '%#CmpItemKindKeyword#' .. icons.misc.Tag .. '%*' .. ' ', -- Tags (example: html tags)
    ['mapping-name'] = '%#CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ',
    ['sequence-name'] = '%CmpItemKindProperty#' .. icons.type.Array .. '%*' .. ' ',
    ['null-name'] = '%CmpItemKindField#' .. icons.kind.Field .. '%*' .. ' ',
    ['boolean-name'] = '%CmpItemKindValue#' .. icons.type.Boolean .. '%*' .. ' ',
    ['integer-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['float-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['string-name'] = '%CmpItemKindValue#' .. icons.type.String .. '%*' .. ' ',
    ['array-name'] = '%CmpItemKindProperty#' .. icons.type.Array .. '%*' .. ' ',
    ['object-name'] = '%CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ',
    ['number-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['table-name'] = '%CmpItemKindProperty#' .. icons.ui.Table .. '%*' .. ' ',
    ['date-name'] = '%CmpItemKindValue#' .. icons.ui.Calendar .. '%*' .. ' ',
    ['date-time-name'] = '%CmpItemKindValue#' .. icons.ui.Table .. '%*' .. ' ',
    ['inline-table-name'] = '%CmpItemKindProperty#' .. icons.ui.Calendar .. '%*' .. ' ',
    ['time-name'] = '%CmpItemKindValue#' .. icons.misc.Watch .. '%*' .. ' ',
    ['module-name'] = '%CmpItemKindModule#' .. icons.kind.Module .. '%*' .. ' ',
  },
  separator = ' ' .. icons.ui.ChevronRight .. ' ',
  depth = 0,
  depth_limit_indicator = '..',
  text_hl = 'LineNr',
}

local function isempty(s)
  return s == nil or s == ''
end

local function filename()
  local filename = vim.fn.expand '%:t'
  local extension = ''
  local file_icon = ''
  local file_icon_color = ''
  local default_file_icon = ''
  local default_file_icon_color = ''

  if not isempty(filename) then
    extension = vim.fn.expand '%:e'

    local default = false

    if isempty(extension) then
      extension = ''
      default = true
    end

    file_icon, file_icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = default })

    local hl_group = 'FileIconColor' .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if file_icon == nil then
      file_icon = default_file_icon
      file_icon_color = default_file_icon_color
    end

    return ' ' .. '%#' .. hl_group .. '#' .. file_icon .. '%*' .. ' ' .. '%#LineNr#' .. filename .. '%*'
  end
end

local function get_gps()
  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return
  end

  if not gps.is_available() then -- Returns boolean value indicating whether a output can be provided
    return
  end

  local retval = filename()

  if gps_location == 'error' then
    return ''
  else
    if not isempty(gps_location) then
      return string.format('%s %s %s', retval, icons.ui.ChevronRight, gps_location)
    else
      return retval
    end
  end
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufWinEnter', 'BufFilePost' }, {
  callback = function()
    local winbar_filetype_exclude = {
      'help',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt.winbar = nil
      return
    end

    local value = get_gps()

    if value == nil then
      value = filename()
    end

    vim.opt.winbar = value
  end,
})
--}}}

--{{{ IDE COLORSCHEME
vim.cmd('colorscheme ' .. ide.colorscheme)
--}}}
