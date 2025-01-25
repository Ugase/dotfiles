return {
   {
      "echasnovski/mini.pairs",
      version = false,
      event = "BufReadPre",
      config = function()
         require("mini.pairs").setup()
      end,
   },
   -- lazy
   {
      "sontungexpt/sttusline",
      branch = "table_version",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      event = "VeryLazy",

      config = function(_, opts)
         require("sttusline").setup({
            components = {
               "mode",
               "git-branch",
               "filename",
               "%=",
               "diagnostics",
               "%=",
               "lsps-formatters",
               "pos-cursor",
            },
         })
      end,
   },
   -- {
   --    "lukas-reineke/indent-blankline.nvim",
   --    event = "BufReadPre",
   --    config = function()
   --       require("ibl").setup()
   --    end,
   -- },
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      lazy = true,
      event = "VeryLazy",
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
         {
            "<leader>ff",
            "<cmd>Telescope find_files follow=true<CR>",
         },
         {
            "<leader>e",
            "<cmd>Telescope find_files follow=true<CR>",
         },
         {
            "<leader>fg",
            "<cmd>Telescope live_grep<CR>",
         },
         {
            "<leader>fb",
            "<cmd>Telescope buffers<CR>",
         },
         {
            "<leader>fs",
            "<cmd>Telescope treesitter<CR>",
         },
      },
   },
}
