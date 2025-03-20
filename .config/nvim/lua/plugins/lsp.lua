return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      -- require("lspconfig").bacon_ls.setup({
      --   init_options = {
      --     updateOnSaveWaitMillis = 3000,
      --   },
      --   ft = "rust",
      -- })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    keys = {
      {
        "<leader>rfc",
        "<cmd>RustLsp flyCheck<cr>",
      },
      {
        "<leader>rrd",
        "<cmd>RustLsp renderDiagnostic<cr>",
      },
      {
        "<leader>rod",
        "<cmd>RustLsp openDocs<cr>",
      },
      {
        "<leader>roc",
        "<cmd>RustLsp openCargo<cr>",
      },
      {
        "<leader>rd",
        "<cmd>RustLsp debuggables<cr>",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonLog",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonUpdate",
    },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("blink.cmp").get_lsp_capabilities(),
          })
        end,
        ["rust_analyzer"] = function() end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          -- Settings from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
          lspconfig.lua_ls.setup({
            capabilities = require("blink.cmp").get_lsp_capabilities(),
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    vim.fn.stdpath("data") .. "/lazy/blink.cmp/lua/blink/cmp/config",
                    "${3rd}/luv/library",
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                },
              },
            },
          })
        end,
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
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
  },
}
