return {
  -- Gitsigns: gutter signs, inline blame, hunk operations
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" }, change = { text = "▎" }, delete = { text = "" },
        topdelete = { text = "" }, changedelete = { text = "▎" }, untracked = { text = "▎" },
      },
      signs_staged_enable = true,
      current_line_blame = false,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        -- Navigation
        map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
        -- Hunk actions
        map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk")
        -- Blame
        map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle Inline Blame")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        -- Diff
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
      end,
    },
  },

  -- Diffview: side-by-side diffs, file history, merge conflicts
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
      { "<leader>gfh","<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed" },
      },
    },
  },

  -- LazyGit: full terminal git UI
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit File" },
      { "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Log" },
    },
  },
}
