return {
  root_markers = { 'deno.json', 'deno.jsonc' },
  settings = {
    typescript = {
      inlayHints = {
        parameterTypes = {
          enabled = true,
        },
        variableTypes = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
      },
    },
    deno = {
      inlayHints = {
        parameterNames = {
          enabled = 'all',
        },
        enumMemberValues = { enabled = true },
      },
      enablePaths = {
        './',
      },
      enable = true,
      lint = true,
      unstable = true,
      codeLens = {
        implementations = true,
        references = true,
        test = true,
        referencesAllFunctions = true,
      },
      suggest = {
        paths = true,
        autoImports = true,
        imports = {
          hosts = {
            ['https://deno.land'] = true,
          },
        },
      },
    },
  },
}
