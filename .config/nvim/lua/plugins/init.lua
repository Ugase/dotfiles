return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    -- event = "vimenter",
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        custom_highlights = function(colors)
          return {
            Pmenu = { bg = colors.none },
            NoiceCmdlinePopupBorder = { fg = colors.none },
          }
        end,
        integrations = {
          blink_cmp = true,
          noice = true,
          fidget = true,
          notify = true,
          cmp = false,
        },
        dim_inactive = {
          enabled = true,
          percentage = 0.45,
        },
        transparent_background = false,
      })
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = require("configs.blink"),
    version = "*",
    opts_extend = { "sources.default" },
  },
}
