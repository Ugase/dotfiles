return {
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "BufReadPre",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          ignore_focus = {},
          always_divide_middle = false,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filetype" },
          lualine_c = {
            {
              "filename",
              file_status = true,
              newfile_status = false,
              path = 3,
              shorting_target = 40,
              symbols = {
                modified = "",
                readonly = "",
                unnamed = "",
                newfile = "",
              },
            },
            "diagnostics",
          },
          lualine_x = {
            "os.date('%I:%M %p')",
            {
              require("tmux-status").tmux_windows,
              cond = require("tmux-status").show,
              padding = { left = 1, right = 1 },
            },
          },
          lualine_y = {
            "branch",
          },
          lualine_z = {
            "progress",
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "lazy", "nvim-tree" },
      })
    end,
  },
}
