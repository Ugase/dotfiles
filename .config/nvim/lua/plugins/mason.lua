return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonLog",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonUpdate",
    },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
}
