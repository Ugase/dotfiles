require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        lua = { "styla" },
        c = { "clang-format" }
    },
    format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback"
    }
})
