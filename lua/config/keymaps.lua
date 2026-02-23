local map = vim.keymap.set

-- Create Splits
map('n', '<leader>wv', ':vsplit<CR>', { desc = "Vertical split" })  -- Vertical split
map('n', '<leader>wh', ':split<CR>', { desc = "Horizontal split" }) -- Horizontal split

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up" })

-- Stay in visual mode after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Paste without yanking in visual mode
map("x", "<leader>p", [["_dP]], { desc = "Paste Without Yanking" })

-- Save with Ctrl+S (familiar from VS Code)
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Center cursor after jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better J (cursor stays in place)
map("n", "J", "mzJ`z")

-- Navigate wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Diagnostic navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
