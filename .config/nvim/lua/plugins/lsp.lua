return {
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
    "williamboman/mason.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "basedpyright",
        "black",
        "isort",
        "ruff",
        "ruff-lsp",
        "mypy",
        "lua-language-server",
        "styla",
        "clang-format",
        "clangd",
      },
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["rust_analyzer"] = function()
          local lsp = require("lspconfig")
          local util = require("lspconfig.util")
          lsp.rust_analyzer.setup({
            on_attach = function(client, bufnr)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
            filetype = { "rust" },
            root_dir = util.root_pattern("Cargo.toml"),
            settings = {
              ["rust_analyzer"] = {
                cargo = {
                  allFeatures = true,
                },
              },
            },
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
  },
}
