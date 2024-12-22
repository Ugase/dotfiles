return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("lint").linters_by_ft = {
            python = { "ruff", "mypy" }
        }
    end
}
