return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {},
  },
  {
    "catppuccin/nvim",
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("config.themey")
    end,
  },

  --  {
  --    "LazyVim/LazyVim",
  --    opts = {
  --      colorscheme = "tokyonight",
  --    },
  --  },
}
