-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
---@class M
local M = {}

M.base46 = {
    theme = "catppuccin",
    transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.nvdash = { load_on_startup = true }
M.ui = {
    statusline = {
        seperator = "round",
        order = {
            "mode",
            "file",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cwd",
            "cursor",
        },
    },
    term = {
        float = { border = "round" },
    },
    cmp = {
        style = "default",
        icons_left = true,
    },
}

return M
