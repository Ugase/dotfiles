return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = "User FilePost",
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff", "mypy" },
                rust = { "clippy" },
            }
        end,
    },
}
