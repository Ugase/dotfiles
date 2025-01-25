local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set
map("n", "<leader>a", function()
   vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })
map(
   "n",
   "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
   function()
      vim.cmd.RustLsp({ "hover", "actions" })
   end,
   { silent = true, buffer = bufnr, desc = "Hover actions" }
)
map("n", "<leader>rfc", function()
   vim.cmd.RustLsp("flyCheck")
end, { desc = "Check for compiler errors" })
map("n", "<leader>rrd", function()
   vim.cmd.RustLsp("renderDiagnostic")
end, { desc = "Render diagnostic" })
map("n", "<leader>rod", function()
   vim.cmd.RustLsp("openDocs")
end, { desc = "Open docs (in docs.rs)" })
map("n", "<leader>roc", function()
   vim.cmd.RustLsp("openCargo")
end, { desc = "Open Cargo.toml" })
