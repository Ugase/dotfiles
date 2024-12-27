require("config.lazy")
local o = vim.o
o.tabstop = 8
o.softtabstop = 2
o.shiftwidth = 2
o.number = true
o.smartindent = true
o.smarttab = true
o.autoindent = true
o.expandtab = true
vim.cmd([[colorscheme tokyonight]])
local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
