require("lualine").setup({
    options = {
        icons_enabled = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = {},
        always_divide_middle = false,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filetype" },
        lualine_c = {
            {
                "filename",
                file_status = true,
                newfile_status = false,
                path = 3,
                shorting_target = 40,
                symbols = {
                    modified = "",
                    readonly = "",
                    unnamed = "",
                    newfile = "",
                },
            },
            "diagnostics",
            {
                require('tmux-status').tmux_session,
                cond = require('tmux-status').show,
                padding = { left = 1 },
            }
        },
        lualine_x = { "os.date('%I:%M %p')" },
        lualine_y = { "branch" },
        lualine_z = { "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "lazy", "nvim-tree" },
})
