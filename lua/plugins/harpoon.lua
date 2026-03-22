return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({ settings = { save_on_toggle = true, sync_on_ui_close = true } })

		-- Quick select by number (hidden from which-key)
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { desc = "which_key_ignore" })
		end

		-- Harpoon submenu (visible in which-key under <leader>h)
		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Edit Menu" })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
			vim.notify("Harpoon: added")
		end, { desc = "Add" })

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>ha" .. i, function()
				local list = harpoon:list()
				local item = list.config.create_list_item(list.config)
				list.items[i] = item
				vim.notify("Harpoon: added to slot " .. i)
			end, { desc = "Add to " .. i })

			vim.keymap.set("n", "<leader>hr" .. i, function()
				local list = harpoon:list()
				list.items[i] = nil
				vim.notify("Harpoon: cleared slot " .. i)
			end, { desc = "Remove " .. i })
		end

		vim.keymap.set("n", "<leader>hx", function()
			harpoon:list():clear()
			vim.notify("Harpoon: cleared all")
		end, { desc = "Clear All" })

		local ok, wk = pcall(require, "which-key")
		if ok then
			wk.add({ { "<leader>h", group = "Harpoon" } })
		end
	end,
}
