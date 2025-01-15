return {
   {
      "echasnovski/mini.starter",
      version = false,
      event = "VimEnter",
      -- config = function()
      --   require("mini.starter").setup({
      --     query_updaters = "",
      --     footer = "\n",
      --     header = "\n                                    oo            \n                                                  \n88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b. \n88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88 \n88    88 88.  ... 88.  .88 88 .88'  88 88  88  88 \ndP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP \n                                                  \n",
      --   })
      -- end,
   },
   {
      "3rd/image.nvim",
      event = "VimEnter",
      config = function()
         require("image").setup()
      end,
   },
   {
      "Kurama622/profile.nvim",
      -- dependencies = { "3rd/image.nvim" },
      -- event = "VimEnter",
      config = function()
         local comp = require("profile.components")
         local win_width = vim.o.columns
         require("profile").setup({
            user = "Ugase",
            git_contributions = {
               start_week = 1, -- The minimum is 1
               end_week = 53, -- The maximum is 53
               empty_char = " ",
               full_char = { "", "󰧞", "", "", "" },
               fake_contributions = nil,
               cache_path = "/tmp/profile.nvim/", -- Cache the data of git contributions locally.
               cache_duration = 24 * 60 * 60,
            },
            avatar_path = "/home/denzel/dotfiles/.config/nvim/lua/avatar.png",
            format = function()
               -- render avatar
               comp:avatar()
               -- customize text component
               comp:text_component_render({
                  comp:text_component("git@github.com:Kurama622/profile.nvim", "center", "ProfileRed"),
                  comp:text_component("──── By Kurama622", "right", "ProfileBlue"),
               })
               comp:separator_render()

               -- Custom card component, render git repository by default
               comp:card_component_render({
                  type = "table",
                  content = function()
                     return {
                        {
                           title = "Ugase/dotfiles",
                           description = [[My config in the terminal (new version)]],
                        },
                        {
                           title = "kurama622/profile.nvim",
                           description = [[A Neovim plugin: Your Personal Homepage]],
                        },
                     }
                  end,
                  hl = {
                     border = "ProfileYellow",
                     text = "ProfileYellow",
                  },
               })
               comp:separator_render()

               -- git contributions, Considering network latency, the module will render asynchronously.
               -- you can also configure `fake_contributions`, so it won't fetch data from the Github
               comp:git_contributions_render("ProfileGreen")
            end,
         })
         vim.api.nvim_set_keymap("n", "<leader>pr", "<cmd>Profile<cr>", { silent = true })
      end,
   },
}
