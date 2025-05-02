return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "BufReadPost",
  opts = {
    options = {
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      hover = {
        enabled = true,
        reveal = { "close" },
      },
    },
  },
}
