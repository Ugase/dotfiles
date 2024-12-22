return {
    'akinsho/bufferline.nvim',
    version = "*",
    lazy = true,
    event = "BufAdd",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {}
    end
}
