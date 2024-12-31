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
o.undofile = true
local function status_off()
  vim.system({ "tmux", "set", "status", "off" }, {}, function() end)
end

local function status_on()
  vim.system({ "tmux", "set", "status", "on" }, {}, function() end)
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = status_off,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = status_on,
})

local map = vim.keymap.set
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", "<leader>s", "<cmd> Lazy sync<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
