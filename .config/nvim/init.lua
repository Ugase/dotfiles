-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  ui = {
      border = "rounded",
      title = "lazy.nvim"
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "",
      },
    },
  },
})

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
o.colorcolumn = "90"

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
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename() <CR>")
map("i", "<F2>", "<cmd>lua vim.lsp.buf.rename() <CR>")
