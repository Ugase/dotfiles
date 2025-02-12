local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 75
local height = 24
local padh = 0.625
local padw = 0.625
local hper = 0.5
local wper = 0.5
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    cmd = "NvimTreeFocus",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            renderer = {
                symlink_destination = false,
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = {
                        row = (gheight - height - padh) * hper,
                        col = (gwidth - width - padw) * wper,
                        width = width,
                        height = height,
                    },
                },
            },
        })
    end,
}
