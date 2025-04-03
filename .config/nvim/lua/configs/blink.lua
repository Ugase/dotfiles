---@module 'blink.cmp'
---@type blink.cmp.Config
return {
  keymap = {
    ["<C-s>"] = { "show", "hide" },
    ["<C-q>"] = { "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },
  appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "normal" },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 650,
      window = { border = "rounded", scrollbar = false },
    },
    menu = { border = "rounded" },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
}
