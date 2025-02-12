return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    event = "User FilePost",
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
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,
        ["rust_analyzer"] = function() end,
      }
    end,
  },
}
