return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      lightbulb = { enable = false },
      ui = {
        border = "rounded",
      },
      symbol_in_winbar = { enable = false },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>rn",
      "<cmd> Lspsaga rename<CR>",
    },
    {
      "<A-h>",
      "<cmd> Lspsaga diagnostic_jump_prev<CR>",
    },
    {
      "<A-l>",
      "<cmd> Lspsaga diagnostic_jump_next<CR>",
    },
    {
      "<C-\\>",
      "<cmd>Lspsaga term_toggle<CR>",
    },
  },
}
