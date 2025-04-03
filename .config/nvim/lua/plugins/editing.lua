return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
    },
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff", "mypy" },
        lua = { "selene" },
      }
    end,
  },
}
