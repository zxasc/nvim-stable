-- lua/plugins/fzf.lua
return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				preview = { layout = "horizontal", horizontal = "right:55%" },
			},
			files = {
				fd_opts = "--hidden --exclude .git --exclude node_modules",
				file_ignore_patterns = { "%.lock" },
			},
			grep = {
				rg_opts = "--hidden --glob '!.git/' --glob '!node_modules/' --glob '!*.lock' --column --line-number --no-heading --color=always --smart-case",
			},
		})
		fzf.register_ui_select()
	end,
	keys = {
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
		{ "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help Tags" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word" },
		{ "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
		{ "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },
		{ "<leader>dd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
	},
}
