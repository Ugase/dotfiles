return {
  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapToggleBreakpoint",
      "DapNew",
    },
    config = function()
      require("dapui").setup()
      local dap = require "dap"
      local dapui = require "dapui"
      local map = vim.keymap.set
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dap.adapters.gdb = {
        type = "executable",
        command = "/usr/bin/gdb",
        name = "gdb",
      }
      dap.configurations.rust = {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      }
      map("n", "<leader>dt", "<cmd>DapToggleBreakpoint<cr>")
      map("n", "<leader>dx", "<cmd>DapTerminate<cr>")
      map("n", "<leader>do", "<cmd>DapStepOver<cr>")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    cmd = {
      "DapToggleBreakpoint",
      "DapNew",
    },
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
