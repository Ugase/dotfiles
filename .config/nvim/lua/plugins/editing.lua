return {
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "BufReadPre",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  -- lazy
  {
    "sontungexpt/sttusline",
    branch = "table_version",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",

    config = function(_, opts)
      require("sttusline").setup({
        components = {
          "mode",
          "git-branch",
          "filename",
          "%=",
          "diagnostics",
          "%=",
          "lsps-formatters",
          "pos-cursor",
        },
      })
    end,
  },
}
