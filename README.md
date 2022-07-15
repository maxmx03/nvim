# Neovim - configuration

My neovim config for web and mobile development.

<div>
  <img src="https://github.com/maxmx03/milianor-dotfiles/blob/main/docs/nvim.png" />
</div>


# Prerequisites

- [Neovim nightly](https://github.com/neovim/neovim/releases)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)


# HOW TO CONFIG

Example for frontend dev zA to open fold, zO to open all folds, zC to close all folds.
to see more:

```lua
:h fold-commands
```

```lua
-- IDE TABLE
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
