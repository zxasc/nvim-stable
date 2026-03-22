return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				-- Rosé Pine
				{ name = "Rosé Pine", colorscheme = "rose-pine-main" },
				{ name = "Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "Rosé Pine Dawn", colorscheme = "rose-pine-dawn" },
				-- Oxocarbon
				{ name = "Oxocarbon Dark", colorscheme = "oxocarbon", before = [[vim.opt.background = "dark"]] },
				{ name = "Oxocarbon Light", colorscheme = "oxocarbon", before = [[vim.opt.background = "light"]] },
			},
			livePreview = true,
		})
	end,
}
