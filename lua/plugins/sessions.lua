return {
	"coffebar/neovim-project",
	opts = {
		projects = {
			"~/Projects/*",
			"~/.config/*",
		},
		picker = {
			type = "fzf-lua", -- one of "telescope", "fzf-lua", or "snacks"
		},
	},
	init = function()
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ibhagwan/fzf-lua" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
