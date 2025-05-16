return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  config = function()
    require("lint").linters_by_ft = {
      python = { "ruff", "mypy" },
      lua = { "selene" },
      json = { "jsonlint" },
      jsonc = { "jsonlint" },
    }
  end,
}
