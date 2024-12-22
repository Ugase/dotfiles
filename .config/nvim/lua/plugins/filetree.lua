return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
    end,
}

