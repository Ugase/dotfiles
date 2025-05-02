return {
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
            on_attach = function(client, bufnr)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
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
            on_attach = function(client, bufnr)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
          })
        end,
      })
    end,
  },
}
