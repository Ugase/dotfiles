require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>")
map("n", "<leader>dpr", function ()
  require("dap-python").test_method()
end
)

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map("n", "<C->", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C->", "<cmd> TmuxNavigateUp<CR>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<leader>wq", "<cmd> wq <cr>")
