return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
    { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal in Neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = { hide_dotfiles = false, hide_gitignored = true },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = { position = "left", width = 35 },
  },
}
