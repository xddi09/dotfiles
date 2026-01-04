return {
  cmd = {
    "emmet-language-server",
    "--stdio",
  },
  filetypes = {
    "php",
    "pug",
    "html",
    "htmldjano",
    "typescriptreact",
    "javascriptreact",
    "css",
    "sass",
    "scss",
    "less",
  },
  init_options = {
    syntaxProfiles = {
      html = {
        filters = "bem",
      },
    },
    preferences = {
      ["bem.elementSeparator"] = "__",
      ["bem.modifierSeparator"] = "--",
      ["bem.shortElementPrefix"] = "-",
      ["lorem.defaultLang"] = "ru",
    },
  },
  root_markers = {
    ".git",
  },
}
