return {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    lazy = false,
    priority = 1000,
    opts = {
        integrations = {
            cmp = true,
            gitsigns = true,
            treesitter = true,
            notify = true,
            mini = { enabled = true },
            native_lsp = { enabled = true },
        },
    },
    config = function(_, opts)
        require("oxocarbon")
        vim.opt.background = "dark"
        vim.cmd.colorscheme("oxocarbon")
    end,
}
