local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 75
local height = 25

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeFocus", "NvimTreeToggle" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
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
      -- From https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if
            #vim.api.nvim_list_wins() == 1
            and require("nvim-tree.utils").is_nvim_tree_buf()
          then
            vim.cmd("wqa")
          end
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
          },
          component_separators = { left = "", right = "" },
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
          lualine_b = {
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
          },
          lualine_c = {
            "diagnostics",
            "branch",
          },
          lualine_x = {
            "filetype",
            "fileformat",
            "os.date('%I:%M:%S %p')",
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
        extensions = { "lazy", "nvim-tree" },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "BufReadPost",
    config = function()
      require("bufferline").setup({
        options = {
          seperator_style = "slope",
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.0.0",
    event = "VeryLazy",
    opts = {
      progress = {
        ignore_empty_message = true,
        ignore_done_already = true,
        suppress_on_insert = true,
        display = { done_ttl = 1 },
      },
      notification = {
        window = {
          winblend = 100,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      lazy_load = true,
      user_default_options = {
        mode = "virtualtext",
        virtualtext = "",
        virtualtext_inline = "before",
      },
    },
  },
  {
    {
      "Bekaboo/dropbar.nvim",
      event = "BufReadPost",
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      config = function()
        local dropbar_api = require("dropbar.api")
        vim.keymap.set(
          "n",
          "<Leader>;",
          dropbar_api.pick,
          { desc = "Pick symbols in winbar" }
        )
        vim.keymap.set(
          "n",
          "[;",
          dropbar_api.goto_context_start,
          { desc = "Go to start of current context" }
        )
        vim.keymap.set(
          "n",
          "];",
          dropbar_api.select_next_context,
          { desc = "Select next context" }
        )
      end,
    },
  },
}
