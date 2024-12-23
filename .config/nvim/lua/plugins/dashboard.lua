return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = '󰚰 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        desc = '💤 Lazy',
                        group = 'DiagnosticHint',
                        action = 'Lazy',
                        key = 'l',
                    },
                    {
                        desc = '  Files',
                        group = 'Number',
                        action = 'NvimTreeOpen',
                        key = 'f',
                    },
                    {
                        desc = "  Quit",
                        group = "Number",
                        action = "q",
                        key = 'q'
                    }
                },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
