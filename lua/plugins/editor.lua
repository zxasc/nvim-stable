return {
    -- Flash: jump anywhere
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },

    -- Surround: add/change/delete surrounding characters
    { "kylechui/nvim-surround", version = "*",         event = "VeryLazy", config = true },

    -- Autopairs
    { "windwp/nvim-autopairs",  event = "InsertEnter", config = true },

    -- Todo comments: highlight and navigate TODO/FIXME/HACK
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
        },
    },

    -- Trouble: better diagnostics panel
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
            { "<leader>cs", "<cmd>Trouble symbols toggle<cr>",                  desc = "Symbols" },
        },
        opts = { focus = true },
    },

    -- Noice: polished UI for cmdline, messages, and LSP
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
    },
}
