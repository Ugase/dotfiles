return {
    'stevearc/conform.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("config.formatter")
    end,
}
