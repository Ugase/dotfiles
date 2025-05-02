return {
  "j-hui/fidget.nvim",
  tag = "v1.0.0",
  event = "LspAttach",
  opts = {
    progress = {
      ignore_empty_message = true,
      ignore_done_already = true,
      suppress_on_insert = true,
      display = { done_ttl = 1 },
    },
    notification = {
      window = {
        winblend = 100,
      },
    },
  },
}
