return {
    -- {
    --    "folke/tokyonight.nvim",
    --    event = "VimEnter",
    --    -- config = function()
    --    --   vim.cmd([[colorscheme tokyonight]])
    --    -- end,
    --    opts = {
    --       styles = {
    --          keywords = {
    --             italic = false,
    --          },
    --       },
    --    },
    -- },
    -- {
    --   "Everblush/nvim",
    --   name = "everblush",
    --   event = "VimEnter",
    --   config = function()
    --     vim.cmd([[colorscheme everblush]])
    --   end,
    -- },
    -- {
    --    "oxfist/night-owl.nvim",
    --    event = "VimEnter",
    --    config = function()
    --      require("night-owl").setup()
    --      vim.cmd.colorscheme("night-owl")
    --    end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = "VimEnter",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end,
    },
    -- {
    --     "projekt0n/github-nvim-theme",
    --     name = "github-theme",
    --     event = "VimEnter",
    --     priority = 1000,
    --     config = function()
    --     require("github-theme").setup({
    --     options = { transparent = true },
    --     })
    --     vim.cmd("colorscheme github_dark")
    --     end,
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
    },
}
