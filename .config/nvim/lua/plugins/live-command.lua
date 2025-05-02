return {
  "smjonas/live-command.nvim",
  cmd = "Norm",
  config = function()
    require("live-command").setup({
      commands = {
        Norm = { cmd = "norm" },
      },
    })
  end,
}
