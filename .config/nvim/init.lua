require("config.lazy")

vim.cmd [[colorscheme tokyonight]]

local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map({ "n", "i" }, "<C-z>", "<cmd> u<CR>")
-- map("i", "<C-H>", "<C-W>")
