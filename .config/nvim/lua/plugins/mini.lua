return {
  "echasnovski/mini.nvim",
  version = false,
  event = "InsertEnter",
  config = function()
    require("mini.pairs").setup()
  end,
}
