require('neo-tree').setup {
  popup_border_style = 'single',
  open_files_using_relative_paths = true,
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    group_empty_dirs = true,
    filtered_items = {
      hide_hidden = false,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
}
