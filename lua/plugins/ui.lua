return {
  -- Bufferline: VS Code-like tab bar
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others" },
      { "<leader>bk", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
      { "<leader>bd", "<cmd>bdelete<cr>", desc = "Close Buffer" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {{
          filetype = "neo-tree", text = "File Explorer",
          highlight = "Directory", text_align = "left", separator = true,
        }},
        separator_style = "thin",
        always_show_bufferline = true,
        sort_by = "insert_after_current",
      },
    },
  },

  -- Lualine: status bar with git/LSP integration
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "lazy", "trouble", "neo-tree" },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = true, show_end = false },
      exclude = { filetypes = { "help", "lazy", "mason", "neo-tree", "dashboard" } },
    },
  },
}
