local map = vim.keymap.set
local api = vim.api

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>")
map("n", "<leader>l", "<cmd> Lazy<CR>")
map("n", "<leader>p", "<cmd> Lazy profile<CR>")
map("n", "<leader>s", "<cmd> Lazy sync<CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")
map("n", "<leader>qf", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<A-j>", "<cmd>m .+1<CR>==")
map("n", "<A-k>", "<cmd>m .-2<CR>==")
map("n", "<leader>n", "<cmd> noh<CR>")
map("n", "gg", "gg0")
map("n", "<C-,>", "<cmd>bp<CR>")
map("n", "<C-.>", "<cmd>bn<CR>")
map("n", "<C-s>", "<cmd>bd<CR>")
map("n", "<C-h>", "<cmd>bp<CR>")
map("n", "<C-l>", "<cmd>bn<CR>")

map("n", "<leader>t", function()
  local buffer_id = api.nvim_create_buf(false, false)
  local gheight = vim.api.nvim_list_uis()[1].height
  api.nvim_open_win(buffer_id, true, {
    split = "below",
    height = gheight / 3,
  })
  local term = vim.fn.jobstart("zsh", { term = true })
  vim.cmd("startinsert")
end)
