require("config.lazy")

vim.cmd [[colorscheme tokyonight]]

local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
