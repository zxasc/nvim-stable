return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    -- "default": C-y=accept, C-n/C-p=navigate, C-space=show, C-e=hide
    -- "super-tab": Tab/S-Tab (closer to VS Code muscle memory)
    appearance = {
      nerd_font_variant = "mono",
      use_nvim_cmp_as_default = true,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
