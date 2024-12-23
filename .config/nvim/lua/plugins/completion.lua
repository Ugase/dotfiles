return {
    "saghen/blink.cmp",
    version = "*",
    lazy = true,
    event = "BufReadPre",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "super-tab" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "normal",
            kind_icons = {
                Function = "󰡱",
                Folder = ""
            }
        },
        completion = {
            -- ghost_text = { enabled = true },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            }
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" }
        }
    },
    opts_extend = { "sources.default" }
}
