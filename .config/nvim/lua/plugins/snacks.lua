return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        input = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        animate = { enabled = true },
    },
}
