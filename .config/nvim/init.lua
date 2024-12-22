require("config.lazy")

require("vimade").setup({
    recipe = { "minimalist", { animate = true } }
})

local themes = require("config.themes")
require("themify").setup(themes)

local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "<C-t>", "<cmd> Twilight<CR>", { desc = "Toggle Twilight" })
map("n", "<leader>th", "<cmd> Themify<CR>", { desc = "Theme switcher / manager" })
