return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 1000 })
      end,
      mode = { "n", "v" },
      desc = "Format file or range",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      rust = { "rustfmt", lsp_format = "fallback" },
      lua = { "stylua" },
      go = { "goimports", "gofumpt" },
      sh = { "shfmt" },
      toml = { "taplo" },
    },
    format_on_save = {
      lsp_format = "fallback",
      async = false,
      timeout_ms = 500,
    },
  },
}
