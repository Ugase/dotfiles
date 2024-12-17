return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "isort",
      "black",
      "lua-language-server",
    },
  },
}
