return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  ft = "rust",
  keys = {
    {
      "<leader>rfc",
      "<cmd>RustLsp flyCheck<cr>",
    },
    {
      "<leader>rrd",
      "<cmd>RustLsp renderDiagnostic<cr>",
    },
    {
      "<leader>rod",
      "<cmd>RustLsp openDocs<cr>",
    },
    {
      "<leader>roc",
      "<cmd>RustLsp openCargo<cr>",
    },
    {
      "<leader>rd",
      "<cmd>RustLsp debuggables<cr>",
    },
  },
}
