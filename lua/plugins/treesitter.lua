return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- Install parsers (this is now the main purpose of the plugin)
		require("nvim-treesitter").install({
			"bash", "lua", "python", "rust", "javascript", "typescript",
			"tsx", "json", "yaml", "toml", "markdown", "markdown_inline",
			"html", "css", "vim", "vimdoc",
		})
	end,
}
