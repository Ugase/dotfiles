return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  config = function()
    vim.lsp.config("lua_ls", {
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
}
