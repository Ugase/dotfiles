require("config.lazy")
local o = vim.o
o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.smartindent = true
o.smarttab = true
o.autoindent = true
o.expandtab = true
o.list = true
vim.cmd([[colorscheme tokyonight]])
local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", "<leader>s", "<cmd> Lazy sync<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
