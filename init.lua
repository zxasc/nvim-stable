vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

require("config.options")
require("config.keymaps")
require("config.lazy")
-- ~/.config/nvim/filetype.lua
vim.filetype.add({
	extension = {
		axaml = "xml",
	},
})
