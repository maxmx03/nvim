require('neo-tree').setup {
  filesystem = {
    hijack_netrw_behavior = 'open_current',
    group_empty_dirs = true,
    filtered_items = {
      hide_hidden = false,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
}
