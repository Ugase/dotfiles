return {
    "folke/snacks.nvim",
    lazy = true,
    priority = 1000,
    event = "VeryLazy",
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        input = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        animate = { enabled = true },
    },
}
