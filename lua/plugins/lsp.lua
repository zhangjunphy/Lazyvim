return {
  "neovim/nvim-lspconfig",
  servers = {
    tinymist = {
      settings = {}
    },
    clangd = {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "-j 4"
      }
    }
  },
}
