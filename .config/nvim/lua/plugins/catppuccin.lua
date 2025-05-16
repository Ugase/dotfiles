return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.none, fg = colors.none },
          BlinkCmpLabelMatch = { bg = colors.none, fg = colors.none, bold = true },
          PmenuSel = { fg = colors.none, bold = true },
          BlinkCmpSignatureHelp = { bg = colors.none, fg = colors.none },
          LspInlayHint = { bg = colors.none },
        }
      end,
      integrations = {
        blink_cmp = true,
        noice = true,
        fidget = true,
        notify = true,
        cmp = false,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
      dim_inactive = {
        enabled = true,
        percentage = 0.45,
      },
      transparent_background = false,
    })
    vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
