return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  cmd = { "NvimTreeFocus", "NvimTreeToggle" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local gheight = vim.api.nvim_list_uis()[1].height
    local gwidth = vim.api.nvim_list_uis()[1].width
    local width = 75
    local height = 25

    require("nvim-tree").setup({
      renderer = {
        symlink_destination = false,
        indent_markers = { enable = true },
        root_folder_label = false,
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            row = (gheight - height - 0.625) * 0.5,
            col = (gwidth - width - 0.625) * 0.5,
            width = width,
            height = height,
          },
        },
      },
    })
  end,
}
