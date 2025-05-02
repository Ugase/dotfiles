return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "ministarter",
            "snacks_dashboard",
            "lazy",
            "NvimTree",
          },
        },
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
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 0,
            shorting_target = 40,
            symbols = {
              modified = "",
              readonly = "",
              unnamed = "",
              newfile = "",
            },
          },
          --
          "diagnostics",
          "branch",
          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return reg
            end
            return "recording @" .. reg
          end,
          function()
            local final = ""
            local lsp_clients = vim.lsp.get_clients({
              bufnr = vim.api.nvim_get_current_buf(),
            })
            for index, value in ipairs(lsp_clients) do
              if #lsp_clients ~= index then
                final = final .. value.name .. ", "
              else
                final = final .. value.name
              end
            end
            return final
          end,
        },
        lualine_x = {
          "filetype",
          "fileformat",
          "os.date('%I:%M:%S %P')",
        },
        lualine_y = {},
        lualine_z = {
          "progress",
          "location",
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
    })
  end,
}
