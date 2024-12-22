return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    event = "VeryLazy",
    opts = function()
        require("config.statusbar")
    end
}
