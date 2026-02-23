return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 10,
        spec = {
            { "<leader>f",  group = "Find/Files" },
            { "<leader>g",  group = "Git" },
            { "<leader>gh", group = "Hunks" },
            { "<leader>b",  group = "Buffers" },
            { "<leader>x",  group = "Diagnostics" },
            { "<leader>c",  group = "Code" },
            { "<leader>q",  group = "Session" },
            { "<leader>u",  group = "UI Toggle" },
            { "<leader>w",  group = "Windows" },
            { "<leader>s",  desc = "Search" },
            { "<leader>S",  desc = "Search Treesitter" },
        },
    },
}
