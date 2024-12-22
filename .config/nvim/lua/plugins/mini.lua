return {
    {
        'echasnovski/mini.nvim',
        version = false,
        lazy = true,
        event = "VeryLazy",
        config = function()
            require('mini.notify').setup()
            require("mini.icons").setup()
        end
    },
    {
        "echasnovski/mini.starter",
        config = function()
            require("mini.starter").setup()
        end
    },
    {
        "echasnovski/mini.pairs",
        lazy = true,
        event = "BufReadPre",
        config = function()
            require("mini.pairs").setup()
        end
    },
    {
        "echasnovski/mini.indentscope",
        lazy = true,
        event = "BufReadPre",
        config = function()
            require("mini.indentscope").setup()
        end
    }
}
