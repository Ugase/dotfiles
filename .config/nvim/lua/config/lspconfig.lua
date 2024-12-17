local lspconfig = require("lspconfig")

local python = {
  "pyright",
}

local servers = {
  "lua_ls",
}

for _, lsp in ipairs(python) do
  lspconfig[lsp].setup({
    filetypes = { "python" },
  })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end
