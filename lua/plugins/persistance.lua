return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { branch = true },
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>qS", function() require("persistence").select() end, desc = "Select Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Last Session" },
  },
}
