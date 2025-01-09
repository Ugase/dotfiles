return {
  {
    "folke/tokyonight.nvim",
    event = "VimEnter",
    -- config = function()
    --   vim.cmd([[colorscheme tokyonight]])
    -- end,
    opts = {
      styles = {
        keywords = {
          italic = false,
        },
      },
    },
  },
  {
    "Everblush/nvim",
    name = "everblush",
    config = function()
      vim.cmd([[colorscheme everblush]])
    end,
  },
}
