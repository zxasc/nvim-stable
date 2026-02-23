return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_config = { horizontal = { prompt_position = "top", preview_width = 0.55 } },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<esc>"] = actions.close,
					},
				},
				file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
			},
			pickers = {
				find_files = { hidden = true },
				buffers = { sort_lastused = true },
			},
			extensions = {
				fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
				["ui-select"] = { require("telescope.themes").get_dropdown({}) },
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>",          desc = "Find Files" },
		{ "<leader>/",       "<cmd>Telescope live_grep<cr>",           desc = "Grep" },
		{ "<leader>,",       "<cmd>Telescope buffers<cr>",             desc = "Buffers" },
		{ "<leader>ff",      "<cmd>Telescope find_files<cr>",          desc = "Find Files" },
		{ "<leader>fg",      "<cmd>Telescope live_grep<cr>",           desc = "Live Grep" },
		{ "<leader>fb",      "<cmd>Telescope buffers<cr>",             desc = "Buffers" },
		{ "<leader>fh",      "<cmd>Telescope help_tags<cr>",           desc = "Help Tags" },
		{ "<leader>fr",      "<cmd>Telescope oldfiles<cr>",            desc = "Recent Files" },
		{ "<leader>fw",      "<cmd>Telescope grep_string<cr>",         desc = "Grep Word" },
		{ "<leader>gc",      "<cmd>Telescope git_commits<cr>",         desc = "Git Commits" },
		{ "<leader>gs",      "<cmd>Telescope git_status<cr>",          desc = "Git Status" },
		{ "<leader>dd",      "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
	},
}
