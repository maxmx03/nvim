# Neovim - configuration

My neovim config for web and mobile development.

<img src="https://github.com/maxmx03/milianor-dotfiles/blob/main/docs/nvim.png" />

## Prerequisites

- [Neovim nightly](https://github.com/neovim/neovim/releases)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)


## How to config

Example for frontend dev, zA to open fold, zO to open all folds, zC to close all folds.
to see more:

```lua
:h fold-commands
```

```lua
-- IDE TABLE
local ide = {}
ide.sidebar = 'left'
ide.colorscheme = 'kanagawa'
ide.formattings = {
  'prettier',
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
  'css',
  'scss',
  'html',
  'javascript',
  'typescript',
  'tsx',
  'vue',
  'svelte',
  'yaml',
}

ide.servers = {
  'html',
  'emmet_ls',
  'cssls',
  'tailwindcss',
  'tsserver',
  'vuels',
  'volar',
  'svelte',
}
```

startup time
```
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.014  000.014: --- NVIM STARTING ---
000.190  000.175: event init
000.345  000.155: early init
000.425  000.080: locale set
000.506  000.081: init first window
001.091  000.585: inits 1
001.112  000.022: window checked
001.117  000.005: parsing arguments
001.746  000.054  000.054: require('vim.shared')
001.880  000.068  000.068: require('vim._meta')
001.882  000.132  000.064: require('vim._editor')
001.884  000.220  000.035: require('vim._init_packages')
001.885  000.548: init lua interpreter
001.932  000.046: expanding arguments
001.972  000.040: inits 2
002.249  000.277: init highlight
002.250  000.002: waiting for UI
003.844  001.593: done waiting for UI
003.856  000.012: init screen for UI
003.871  000.015: init default mappings
003.880  000.009: init default autocommands
004.910  000.052  000.052: sourcing /usr/share/nvim/runtime/ftplugin.vim
005.098  000.029  000.029: sourcing /usr/share/nvim/runtime/indent.vim
007.721  000.178  000.178: require('packer.util')
007.742  002.048  001.870: require('packer')
007.963  000.219  000.219: require('packer.log')
008.439  000.164  000.164: require('packer.async')
008.768  000.125  000.125: require('packer.result')
008.771  000.329  000.204: require('packer.jobs')
008.776  000.779  000.286: require('packer.plugin_utils')
009.008  000.224  000.224: require('packer.snapshot')
011.884  002.798  002.798: require('impatient')
013.399  000.065  000.065: sourcing /usr/share/nvim/runtime/autoload/provider/pythonx.vim
013.753  000.167  000.167: sourcing /usr/share/nvim/runtime/autoload/remote/host.vim
013.849  000.657  000.425: sourcing /usr/share/nvim/runtime/autoload/provider/python3.vim
013.880  000.006  000.006: require('vim.keymap')
014.347  000.035  000.035: require('null-ls.methods')
014.358  000.080  000.045: require('null-ls.utils')
014.452  000.003  000.003: require('vim.F')
014.483  000.123  000.119: require('vim.diagnostic')
014.492  000.250  000.048: require('null-ls.config')
014.543  000.023  000.023: require('null-ls.helpers.cache')
014.576  000.031  000.031: require('null-ls.helpers.diagnostics')
014.607  000.030  000.030: require('null-ls.helpers.formatter_factory')
014.669  000.025  000.025: require('null-ls.logger')
014.701  000.030  000.030: require('null-ls.state')
014.704  000.095  000.039: require('null-ls.helpers.generator_factory')
014.776  000.038  000.038: require('null-ls.helpers.command_resolver')
014.778  000.073  000.035: require('null-ls.helpers.make_builtin')
014.805  000.025  000.025: require('null-ls.helpers.range_formatting_args_factory')
014.807  000.313  000.035: require('null-ls.helpers')
014.884  000.033  000.033: require('null-ls.diagnostics')
014.890  000.082  000.049: require('null-ls.sources')
014.917  000.025  000.025: require('null-ls.builtins')
015.161  000.075  000.075: require('vim.lsp.log')
015.326  000.163  000.163: require('vim.lsp.protocol')
015.486  000.080  000.080: require('vim.lsp._snippet')
015.527  000.038  000.038: require('vim.highlight')
015.538  000.209  000.091: require('vim.lsp.util')
015.546  000.517  000.070: require('vim.lsp.handlers')
015.610  000.062  000.062: require('vim.lsp.rpc')
015.642  000.030  000.030: require('vim.lsp.sync')
015.695  000.051  000.051: require('vim.lsp.buf')
015.738  000.041  000.041: require('vim.lsp.diagnostic')
015.781  000.041  000.041: require('vim.lsp.codelens')
015.820  000.872  000.131: require('vim.lsp')
015.823  000.904  000.031: require('null-ls.info')
015.824  001.622  000.048: require('null-ls')
015.871  000.044  000.044: require('null-ls.builtins.formatting.prettier')
015.908  000.035  000.035: require('null-ls.builtins.formatting.stylua')
015.960  000.050  000.050: require('null-ls.builtins.diagnostics.eslint')
016.007  000.044  000.044: require('null-ls.builtins.completion.spell')
016.057  000.047  000.047: require('null-ls.builtins.code_actions.eslint')
016.211  000.053  000.053: require('null-ls.client')
016.437  000.033  000.033: require('luasnip.session')
016.482  000.041  000.041: require('luasnip.util.util')
016.534  000.025  000.025: require('luasnip.util.types')
016.588  000.024  000.024: require('luasnip.util.ext_opts')
016.592  000.057  000.033: require('luasnip.nodes.util')
016.615  000.022  000.022: require('luasnip.util.events')
016.622  000.258  000.079: require('luasnip.nodes.node')
016.666  000.042  000.042: require('luasnip.nodes.insertNode')
016.698  000.031  000.031: require('luasnip.nodes.textNode')
016.737  000.037  000.037: require('luasnip.util.mark')
016.787  000.048  000.048: require('luasnip.util.environ')
016.815  000.026  000.026: require('luasnip.util.pattern_tokenizer')
016.838  000.022  000.022: require('luasnip.util.dict')
016.869  000.030  000.030: require('luasnip.session.snippet_collection')
016.886  000.581  000.087: require('luasnip.nodes.snippet')
016.946  000.030  000.030: require('luasnip.loaders._caches')
016.948  000.060  000.030: require('luasnip.loaders')
017.002  000.042  000.042: require('luasnip.nodes.functionNode')
017.061  000.057  000.057: require('luasnip.nodes.choiceNode')
017.104  000.042  000.042: require('luasnip.nodes.dynamicNode')
017.145  000.039  000.039: require('luasnip.nodes.restoreNode')
017.197  000.021  000.021: require('luasnip.util.functions')
017.200  000.053  000.032: require('luasnip.util.parser')
017.442  000.023  000.023: require('vim.treesitter.language')
017.449  000.070  000.046: require('vim.treesitter.query')
017.490  000.039  000.039: require('vim.treesitter.languagetree')
017.497  000.157  000.048: require('vim.treesitter')
017.650  000.396  000.239: require('nvim-treesitter.parsers')
017.732  000.041  000.041: require('nvim-treesitter.utils')
017.738  000.086  000.045: require('nvim-treesitter.ts_utils')
017.740  000.509  000.027: require('luasnip.extras.filetype_functions')
017.783  000.034  000.034: require('luasnip.extras')
017.823  000.038  000.038: require('luasnip.extras.fmt')
017.849  000.024  000.024: require('luasnip.extras.expand_conditions')
017.889  000.037  000.037: require('luasnip.nodes.absolute_indexer')
017.932  000.730  000.088: require('luasnip.config')
017.934  001.693  000.089: require('luasnip')
018.088  000.036  000.036: require('cmp.utils.debug')
018.173  000.051  000.051: require('cmp.utils.char')
018.179  000.089  000.038: require('cmp.utils.str')
018.210  000.030  000.030: require('cmp.utils.pattern')
018.335  000.047  000.047: require('cmp.utils.misc')
018.364  000.028  000.028: require('cmp.utils.buffer')
018.416  000.050  000.050: require('cmp.utils.api')
018.424  000.182  000.057: require('cmp.utils.keymap')
018.428  000.216  000.034: require('cmp.utils.feedkeys')
018.507  000.078  000.078: require('cmp.utils.async')
018.627  000.028  000.028: require('cmp.types.cmp')
018.696  000.067  000.067: require('cmp.types.lsp')
018.728  000.029  000.029: require('cmp.types.vim')
018.729  000.158  000.034: require('cmp.types')
018.757  000.026  000.026: require('cmp.utils.cache')
018.762  000.252  000.068: require('cmp.context')
018.885  000.040  000.040: require('cmp.config.mapping')
018.969  000.042  000.042: require('cmp.config.compare')
018.971  000.082  000.041: require('cmp.config.default')
018.986  000.179  000.057: require('cmp.config')
019.177  000.037  000.037: require('cmp.matcher')
019.184  000.197  000.159: require('cmp.entry')
019.189  000.426  000.050: require('cmp.source')
019.269  000.030  000.030: require('cmp.utils.event')
019.352  000.041  000.041: require('cmp.utils.window')
019.355  000.084  000.042: require('cmp.view.docs_view')
019.442  000.044  000.044: require('cmp.utils.autocmd')
019.451  000.095  000.051: require('cmp.view.custom_entries_view')
019.552  000.100  000.100: require('cmp.view.wildmenu_entries_view')
019.618  000.065  000.065: require('cmp.view.native_entries_view')
019.671  000.051  000.051: require('cmp.view.ghost_text_view')
019.680  000.490  000.067: require('cmp.view')
019.711  001.719  000.101: require('cmp.core')
019.874  000.041  000.041: require('cmp.config.sources')
020.020  000.144  000.144: require('cmp.config.window')
020.076  002.141  000.236: require('cmp')
020.159  000.071  000.071: require('lspkind')
020.249  000.036  000.036: require('luasnip.util.str')
020.367  000.054  000.054: require('luasnip.util.path')
020.371  000.120  000.067: require('luasnip.loaders.util')
020.425  000.053  000.053: require('luasnip.nodes.snippetProxy')
020.432  000.271  000.062: require('luasnip.loaders.from_vscode')
023.020  000.053  000.053: require('lsp_signature.helper')
023.034  000.123  000.069: require('lsp_signature')
023.078  000.034  000.034: require('lspsaga')
023.132  000.028  000.028: require('lspsaga.libs')
023.146  000.065  000.038: require('lspsaga.lightbulb')
023.281  000.021  000.021: require('nvim-lsp-installer.core.functional.data')
023.309  000.026  000.026: require('nvim-lsp-installer.core.functional.function')
023.339  000.027  000.027: require('nvim-lsp-installer.core.functional.list')
023.364  000.022  000.022: require('nvim-lsp-installer.core.functional.relation')
023.387  000.022  000.022: require('nvim-lsp-installer.core.functional.logic')
023.417  000.027  000.027: require('nvim-lsp-installer.core.functional.number')
023.442  000.023  000.023: require('nvim-lsp-installer.core.functional.string')
023.467  000.023  000.023: require('nvim-lsp-installer.core.functional.table')
023.493  000.024  000.024: require('nvim-lsp-installer.core.functional.type')
023.494  000.258  000.041: require('nvim-lsp-installer.core.functional')
023.519  000.024  000.024: require('nvim-lsp-installer.core.path')
023.551  000.030  000.030: require('nvim-lsp-installer.settings')
023.615  000.028  000.028: require('nvim-lsp-installer.core.result')
023.631  000.078  000.051: require('nvim-lsp-installer.core.platform')
023.650  000.438  000.047: require('nvim-lsp-installer.log')
023.687  000.036  000.036: require('nvim-lsp-installer.core.async')
023.718  000.029  000.029: require('nvim-lsp-installer.core.async.uv')
023.723  000.536  000.034: require('nvim-lsp-installer.core.fs')
023.745  000.021  000.021: require('nvim-lsp-installer.notify')
023.768  000.022  000.022: require('nvim-lsp-installer.dispatcher')
023.843  000.073  000.073: require('nvim-lsp-installer.core.process')
023.954  000.031  000.031: require('nvim-lsp-installer.core.ui')
024.016  000.022  000.022: require('nvim-lsp-installer.core.ui.state')
024.018  000.062  000.040: require('nvim-lsp-installer.core.ui.display')
024.082  000.063  000.063: require('nvim-lsp-installer.servers')
024.111  000.027  000.027: require('nvim-lsp-installer.jobs.pool')
024.177  000.025  000.025: require('nvim-lsp-installer.jobs.outdated-servers.version-check-result')
024.237  000.028  000.028: require('nvim-lsp-installer.core.spawn')
024.267  000.028  000.028: require('nvim-lsp-installer.core.optional')
024.298  000.030  000.030: require('nvim-lsp-installer.core.installer')
024.301  000.122  000.036: require('nvim-lsp-installer.core.managers.npm')
024.335  000.032  000.032: require('nvim-lsp-installer.core.managers.pip3')
024.364  000.028  000.028: require('nvim-lsp-installer.core.managers.git')
024.396  000.030  000.030: require('nvim-lsp-installer.core.managers.gem')
024.425  000.029  000.029: require('nvim-lsp-installer.core.managers.go')
024.537  000.025  000.025: require('nvim-lsp-installer.core.managers.powershell')
024.541  000.052  000.028: require('nvim-lsp-installer.core.fetch')
024.542  000.077  000.024: require('nvim-lsp-installer.core.managers.cargo.client')
024.544  000.117  000.041: require('nvim-lsp-installer.core.managers.cargo')
024.611  000.034  000.034: require('nvim-lsp-installer.core.managers.std')
024.646  000.034  000.034: require('nvim-lsp-installer.core.managers.github.client')
024.651  000.106  000.038: require('nvim-lsp-installer.core.managers.github')
024.682  000.030  000.030: require('nvim-lsp-installer.core.managers.composer')
024.730  000.023  000.023: require('nvim-lsp-installer.core.clients.eclipse')
024.732  000.048  000.025: require('nvim-lsp-installer.jobs.outdated-servers.jdtls')
024.770  000.037  000.037: require('nvim-lsp-installer.core.managers.luarocks')
024.774  000.661  000.056: require('nvim-lsp-installer.jobs.outdated-servers')
024.816  000.032  000.032: require('nvim-lsp-installer.jobs.version-check')
024.843  000.025  000.025: require('nvim-lsp-installer.ui.server_hints')
024.872  000.028  000.028: require('nvim-lsp-installer.ui.components.settings-schema')
024.877  001.033  000.104: require('nvim-lsp-installer.ui')
024.911  000.032  000.032: require('nvim-lsp-installer._generated.language_autocomplete_map')
024.977  000.065  000.065: require('nvim-lsp-installer._generated.filetype_map')
024.982  001.826  000.044: require('nvim-lsp-installer')
025.082  000.061  000.061: require('lspconfig.util')
025.086  000.091  000.030: require('nvim-lsp-installer.middleware')
025.146  000.030  000.030: require('lspconfig.configs')
025.149  000.060  000.030: require('lspconfig')
025.207  000.026  000.026: require('cmp_nvim_lsp.source')
025.209  000.060  000.033: require('cmp_nvim_lsp')
025.301  000.030  000.030: require('lspconfig.server_configurations.pylsp')
025.601  000.030  000.030: require('nvim-lsp-installer.core.receipt')
025.607  000.066  000.036: require('nvim-lsp-installer.core.installer.context')
025.612  000.099  000.034: require('nvim-lsp-installer.server')
025.614  000.134  000.035: require('nvim-lsp-installer.servers.pylsp')
025.712  000.034  000.034: require('lspconfig.server_configurations.tsserver')
025.850  000.040  000.040: require('nvim-lsp-installer.servers.tsserver')
025.916  000.039  000.039: require('lua-dev')
025.942  000.023  000.023: require('lua-dev.config')
026.238  000.029  000.029: require('lua-dev.sumneko')
027.455  000.035  000.035: require('lspconfig.server_configurations.sumneko_lua')
027.580  000.030  000.030: require('nvim-lsp-installer.servers.sumneko_lua')
027.634  000.037  000.037: require('lspconfig.server_configurations.prismals')
027.760  000.027  000.027: require('nvim-lsp-installer.servers.prismals')
027.814  000.037  000.037: require('lspconfig.server_configurations.graphql')
027.931  000.029  000.029: require('nvim-lsp-installer.servers.graphql')
027.983  000.031  000.031: require('lspconfig.server_configurations.cssls')
028.125  000.029  000.029: require('nvim-lsp-installer.servers.vscode-langservers-extracted')
028.127  000.055  000.026: require('nvim-lsp-installer.servers.cssls')
028.179  000.033  000.033: require('lspconfig.server_configurations.html')
028.294  000.025  000.025: require('nvim-lsp-installer.servers.html')
028.355  000.034  000.034: require('lspconfig.server_configurations.vuels')
028.476  000.032  000.032: require('nvim-lsp-installer.servers.vuels')
028.529  000.037  000.037: require('lspconfig.server_configurations.volar')
028.659  000.029  000.029: require('nvim-lsp-installer.servers.volar')
028.703  000.029  000.029: require('lspconfig.server_configurations.emmet_ls')
028.816  000.027  000.027: require('nvim-lsp-installer.servers.emmet_ls')
028.870  000.037  000.037: require('lspconfig.server_configurations.tailwindcss')
029.003  000.028  000.028: require('nvim-lsp-installer.servers.tailwindcss')
029.110  000.032  000.032: require('lspconfig.server_configurations.svelte')
029.228  000.026  000.026: require('nvim-lsp-installer.servers.svelte')
029.403  000.146  000.146: require('nvim-web-devicons')
030.986  000.031  000.031: require('nvim-treesitter.tsrange')
031.013  000.024  000.024: require('nvim-treesitter.caching')
031.020  000.099  000.044: require('nvim-treesitter.query')
031.031  000.165  000.066: require('nvim-treesitter.configs')
031.114  000.029  000.029: require('nvim-treesitter.info')
031.154  000.038  000.038: require('nvim-treesitter.shell_command_selectors')
031.170  000.133  000.066: require('nvim-treesitter.install')
033.533  000.029  000.029: require('nvim-tree.events')
033.622  000.034  000.034: require('nvim-tree.log')
033.966  000.030  000.030: require('nvim-tree.iterators.node-iterator')
033.983  000.360  000.330: require('nvim-tree.utils')
034.027  000.042  000.042: require('nvim-tree.git.utils')
034.059  000.031  000.031: require('nvim-tree.git.runner')
034.085  000.025  000.025: require('nvim-tree.watcher')
034.088  000.529  000.038: require('nvim-tree.git')
034.128  000.027  000.027: require('nvim-tree.explorer.watch')
034.196  000.029  000.029: require('nvim-tree.explorer.node-builders')
034.223  000.025  000.025: require('nvim-tree.explorer.common')
034.248  000.024  000.024: require('nvim-tree.explorer.sorters')
034.274  000.024  000.024: require('nvim-tree.explorer.filters')
034.360  000.057  000.057: require('nvim-tree.view')
034.363  000.088  000.031: require('nvim-tree.live-filter')
034.365  000.236  000.046: require('nvim-tree.explorer.explore')
034.395  000.029  000.029: require('nvim-tree.explorer.reload')
034.398  000.863  000.042: require('nvim-tree.explorer')
034.400  000.917  000.026: require('nvim-tree.core')
034.430  000.030  000.030: require('nvim-tree.diagnostics')
034.458  000.026  000.026: require('nvim-tree.renderer.components.padding')
034.485  000.026  000.026: require('nvim-tree.renderer.components.icons')
034.515  000.028  000.028: require('nvim-tree.renderer.components.full-name')
034.540  000.024  000.024: require('nvim-tree.renderer.help')
034.575  000.034  000.034: require('nvim-tree.renderer.components.git')
034.612  000.036  000.036: require('nvim-tree.renderer.builder')
034.639  000.026  000.026: require('nvim-tree.marks')
034.645  001.189  000.042: require('nvim-tree.renderer')
034.675  000.028  000.028: require('nvim-tree.actions.tree-modifiers.collapse-all')
034.700  000.023  000.023: require('nvim-tree.actions.root.dir-up')
034.728  000.027  000.027: require('nvim-tree.actions.root.change-dir')
034.755  000.026  000.026: require('nvim-tree.actions.reloaders.reloaders')
034.785  000.028  000.028: require('nvim-tree.actions.finders.find-file')
034.787  001.360  000.039: require('nvim-tree.lib')
034.819  000.031  000.031: require('nvim-tree.colors')
034.862  000.042  000.042: require('nvim-tree.legacy')
034.897  000.033  000.033: require('nvim-tree.actions.fs.copy-paste')
034.954  000.026  000.026: require('nvim-tree.actions.tree-modifiers.expand-all')
034.981  000.026  000.026: require('nvim-tree.actions.tree-modifiers.toggles')
035.010  000.026  000.026: require('nvim-tree.actions.fs.create-file')
035.049  000.038  000.038: require('nvim-tree.actions.fs.rename-file')
035.087  000.036  000.036: require('nvim-tree.actions.fs.trash')
035.115  000.027  000.027: require('nvim-tree.actions.fs.remove-file')
035.141  000.024  000.024: require('nvim-tree.actions.moves.parent')
035.166  000.024  000.024: require('nvim-tree.actions.moves.sibling')
035.214  000.046  000.046: require('nvim-tree.actions.moves.item')
035.243  000.025  000.025: require('nvim-tree.actions.finders.search-node')
035.269  000.024  000.024: require('nvim-tree.actions.node.run-command')
035.296  000.026  000.026: require('nvim-tree.actions.node.file-popup')
035.330  000.032  000.032: require('nvim-tree.actions.node.system-open')
035.334  000.434  000.055: require('nvim-tree.actions.dispatch')
035.345  001.986  000.086: require('nvim-tree')
035.627  000.031  000.031: require('vim.inspect')
036.331  000.058  000.058: require('nvim-tree.actions')
036.373  000.038  000.038: require('nvim-tree.actions.node.open-file')
037.237  000.037  000.037: require('telescope._extensions')
037.241  000.076  000.039: require('telescope')
037.393  000.028  000.028: require('plenary.bit')
037.431  000.035  000.035: require('plenary.functional')
037.454  000.017  000.017: require('ffi')
037.464  000.148  000.068: require('plenary.path')
037.470  000.181  000.033: require('plenary.strings')
037.495  000.025  000.025: require('telescope.deprecated')
037.618  000.051  000.051: require('plenary.log')
037.635  000.089  000.038: require('telescope.log')
037.734  000.045  000.045: require('plenary.job')
037.764  000.028  000.028: require('telescope.state')
037.770  000.134  000.061: require('telescope.utils')
037.774  000.278  000.055: require('telescope.sorters')
038.815  001.572  001.088: require('telescope.config')
039.426  000.031  000.031: require('kanagawa')
039.460  000.031  000.031: require('kanagawa.colors')
039.497  000.027  000.027: require('kanagawa.themes')
039.560  000.196  000.107: require('theme.kanagawa')
039.629  000.030  000.030: require('lualine_require')
039.962  000.399  000.368: require('lualine.component')
040.502  000.535  000.535: require('lualine')
041.028  000.041  000.041: require('lualine.utils.mode')
043.300  000.110  000.110: require('tabline.term')
043.313  000.203  000.093: require('tabline')
043.773  000.027  000.027: require('nvim-ts-autotag._log')
043.778  000.069  000.042: require('nvim-ts-autotag.utils')
043.789  000.136  000.067: require('nvim-ts-autotag.internal')
043.792  000.181  000.045: require('nvim-ts-autotag')
043.915  000.042  000.042: require('nvim-autopairs._log')
043.977  000.060  000.060: require('nvim-autopairs.utils')
044.122  000.058  000.058: require('nvim-autopairs.conds')
044.136  000.120  000.062: require('nvim-autopairs.rule')
044.138  000.159  000.039: require('nvim-autopairs.rules.basic')
044.147  000.335  000.074: require('nvim-autopairs')
044.514  000.079  000.079: require('colorizer/nvim')
044.640  000.123  000.123: require('colorizer/trie')
044.756  000.385  000.183: require('colorizer')
045.881  000.033  000.033: require('diffview.lazy')
045.932  000.048  000.048: require('diffview.oop')
045.945  000.134  000.053: require('diffview.events')
045.951  000.219  000.085: require('diffview.bootstrap')
046.005  000.053  000.053: require('diffview.colors')
046.170  000.101  000.101: require('diffview.utils')
046.185  000.164  000.063: require('diffview.arg_parser')
046.451  000.792  000.356: require('diffview')
046.581  000.065  000.065: require('diffview.actions')
046.607  000.153  000.088: require('diffview.config')
046.786  000.069  000.069: require('indent_blankline/utils')
046.788  000.142  000.072: require('indent_blankline')
046.876  000.033  000.033: require('Comment')
046.991  000.056  000.056: require('Comment.utils')
047.033  000.040  000.040: require('Comment.extra')
047.119  000.038  000.038: require('Comment.config')
047.121  000.087  000.049: require('Comment.opfunc')
047.130  000.252  000.069: require('Comment.api')
047.340  000.035  000.035: require('hop.perm')
047.406  000.023  000.023: require('hop.priority')
047.411  000.068  000.045: require('hop.hint')
047.413  000.146  000.043: require('hop.defaults')
047.487  000.031  000.031: require('hop.window')
047.504  000.090  000.059: require('hop.jump_target')
047.509  000.302  000.066: require('hop')
047.540  000.029  000.029: require('hop.highlight')
047.654  000.076  000.076: require('dashboard')
047.772  000.058  000.058: require('fidget.log')
047.781  000.117  000.059: require('fidget')
047.984  000.194  000.194: require('fidget.spinners')
048.222  000.085  000.085: require('nvim-gps.utils')
048.245  000.230  000.146: require('nvim-gps')
048.801  000.151  000.151: require('kanagawa.hlgroups')
049.460  000.905  000.754: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/kanagawa.nvim/colors/kanagawa.vim
052.690  000.299  000.299: require('diffview.lib')
052.732  047.579  021.537: sourcing /home/milianor/.config/nvim/init.lua
052.742  001.202: sourcing vimrc file(s)
053.121  000.012  000.012: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/LuaSnip/ftdetect/snippets.vim
053.623  000.639  000.627: sourcing /usr/share/nvim/runtime/filetype.lua
053.652  000.014  000.014: sourcing /usr/share/nvim/runtime/filetype.vim
053.927  000.083  000.083: sourcing /usr/share/nvim/runtime/syntax/synload.vim
054.051  000.344  000.261: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
055.534  000.180  000.180: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/LuaSnip/plugin/luasnip.vim
055.756  000.208  000.208: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/hop.nvim/plugin/hop.vim
055.941  000.086  000.086: require('indent_blankline.commands')
056.000  000.231  000.145: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim/plugin/indent_blankline.vim
056.048  000.033  000.033: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua/plugin/colorizer.vim
056.146  000.056  000.056: require('nvim-gps.internal')
056.313  000.085  000.085: require('nvim-treesitter.query_predicates')
056.324  000.176  000.091: require('nvim-treesitter')
056.327  000.245  000.014: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-gps/plugin/nvim-gps.vim
056.429  000.089  000.089: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer/plugin/nvim-lsp-installer.vim
056.553  000.111  000.111: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig/plugin/lspconfig.vim
056.578  000.009  000.009: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag/plugin/nvim-ts-autotag.vim
056.617  000.029  000.029: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
056.654  000.025  000.025: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
057.113  000.167  000.167: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
057.133  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/health.vim
057.176  000.034  000.034: sourcing /usr/share/nvim/runtime/plugin/man.vim
057.634  000.172  000.172: sourcing /usr/share/nvim/runtime/pack/dist/opt/matchit/plugin/matchit.vim
057.732  000.546  000.374: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
057.885  000.141  000.141: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
058.240  000.342  000.342: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
058.389  000.008  000.008: sourcing /home/milianor/.local/share/nvim/rplugin.vim
058.396  000.136  000.128: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
058.466  000.056  000.056: sourcing /usr/share/nvim/runtime/plugin/shada.vim
058.504  000.020  000.020: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
058.618  000.101  000.101: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
058.720  000.081  000.081: sourcing /usr/share/nvim/runtime/plugin/tohtml.vim
058.753  000.016  000.016: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
058.912  000.146  000.146: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
059.812  000.122  000.122: require('dashboard.session')
059.823  000.242  000.121: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/dashboard-nvim/plugin/dashboard.lua
059.912  000.068  000.068: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/diffview.nvim/plugin/diffview.lua
060.120  000.186  000.186: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/lspsaga.nvim/plugin/lspsaga.lua
060.198  000.029  000.029: require('cmp.utils.highlight')
060.403  000.261  000.232: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-cmp/plugin/cmp.lua
061.000  000.572  000.572: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-treesitter/plugin/nvim-treesitter.lua
061.142  000.117  000.117: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/telescope.nvim/plugin/telescope.lua
061.504  000.305  000.305: sourcing /home/milianor/.config/nvim/plugin/packer_compiled.lua
061.690  003.246: loading rtp plugins
062.219  000.184  000.184: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/LuaSnip/plugin/luasnip.vim
062.499  000.076  000.076: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/dashboard-nvim/plugin/dashboard.lua
062.620  000.036  000.036: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/diffview.nvim/plugin/diffview.lua
062.933  000.219  000.219: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/hop.nvim/plugin/hop.vim
063.054  000.010  000.010: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim/plugin/indent_blankline.vim
063.330  000.116  000.116: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/lspsaga.nvim/plugin/lspsaga.lua
063.506  000.020  000.020: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-cmp/plugin/cmp.lua
063.569  000.009  000.009: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua/plugin/colorizer.vim
063.686  000.027  000.027: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-gps/plugin/nvim-gps.vim
063.775  000.010  000.010: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer/plugin/nvim-lsp-installer.vim
063.862  000.008  000.008: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig/plugin/lspconfig.vim
064.011  000.027  000.027: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-treesitter/plugin/nvim-treesitter.lua
064.086  000.023  000.023: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag/plugin/nvim-ts-autotag.vim
064.175  000.009  000.009: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
064.316  000.026  000.026: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
064.468  000.029  000.029: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/telescope.nvim/plugin/telescope.lua
064.623  002.103: loading packages
066.383  000.089  000.089: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/Comment.nvim/after/plugin/Comment.lua
066.564  000.024  000.024: require('cmp_buffer.timer')
066.568  000.059  000.035: require('cmp_buffer.buffer')
066.571  000.092  000.033: require('cmp_buffer.source')
066.573  000.118  000.027: require('cmp_buffer')
066.591  000.155  000.036: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/cmp-buffer/after/plugin/cmp_buffer.lua
066.723  000.061  000.061: require('cmp_cmdline')
066.737  000.092  000.030: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/cmp-cmdline/after/plugin/cmp_cmdline.lua
066.832  000.033  000.033: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua
066.944  000.044  000.044: require('cmp_path')
066.958  000.073  000.029: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/cmp-path/after/plugin/cmp_path.lua
067.062  000.033  000.033: require('cmp_luasnip')
067.089  000.078  000.045: sourcing /home/milianor/.local/share/nvim/site/pack/packer/start/cmp_luasnip/after/plugin/cmp_luasnip.lua
067.092  001.949: loading after plugins
067.104  000.012: inits 3
069.567  002.463: reading ShaDa
070.296  000.048  000.048: require('nvim-treesitter.indent')
070.487  000.042  000.042: require('nvim-treesitter.locals')
070.565  000.041  000.041: require('luasnip.loaders.from_lua')
070.621  000.038  000.038: require('luasnip.loaders.from_snipmate')
070.653  000.917: opening buffers
070.790  000.036  000.036: require('dashboard.preview')
070.801  000.111: BufEnter autocommands
070.803  000.002: editing files in windows
074.500  000.056  000.056: require('vim.treesitter.highlighter')
074.508  000.115  000.058: require('nvim-treesitter.highlight')
075.172  004.254: VimEnter autocommands
075.175  000.003: UIEnter autocommands
075.534  000.207  000.207: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim
075.541  000.160: before starting main loop
076.819  001.278: first screen update
076.821  000.002: --- NVIM STARTED ---
```
