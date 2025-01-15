return {
  {
    "folke/tokyonight.nvim",
    event = "VimEnter",
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {
      styles = {
        keywords = {
          italic = false,
        },
      },
    },
  },
  -- {
  --   "Everblush/nvim",
  --   name = "everblush",
  --   event = "VimEnter",
  --   config = function()
  --     vim.cmd([[colorscheme everblush]])
  --   end,
  -- },
  {
    "oxfist/night-owl.nvim",
    event = "VimEnter",
    -- config = function()
    --   require("night-owl").setup()
    --   vim.cmd.colorscheme("night-owl")
    -- end,
  },
  { "nvim-treesitter/nvim-treesitter", event = "VeryLazy", build = ":TSUpdate" },
}
