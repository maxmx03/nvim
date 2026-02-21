return {
  root_markers = { 'deno.json', 'deno.jsonc' },
  settings = {
    editor = {
      inlayHints = {
        enabled = true,
      },
    },
    deno = {
      enablePaths = {
        './',
      },
      enable = true,
      lint = true,
      unstable = true,
      suggest = {
        imports = {
          hosts = {
            ['https://deno.land'] = true,
          },
        },
      },
    },
  },
}
