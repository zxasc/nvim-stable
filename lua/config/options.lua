vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

local opt = vim.opt

-- Line numbers
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers (great for jumping with 5j, 12k etc.)

-- Tabs & Indentation
opt.tabstop = 4        -- Number of spaces tabs count for
opt.shiftwidth = 4     -- Size of an indent
opt.softtabstop = 4    -- Number of spaces for a tab in insert mode
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.autoindent = true  -- Copy indent from current line when starting new one

-- Line wrapping
opt.wrap = false -- Disable line wrap (long lines scroll horizontally)

-- Cursor & Scrolling
opt.scrolloff = 999
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
opt.cursorline = true -- Highlight current line

-- Search
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true  -- ...unless you use uppercase in search
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Show matches while typing

-- Appearance
opt.termguicolors = true -- True color support (required for most colorschemes)
opt.signcolumn = "yes"   -- Always show sign column (prevents text shifting)
opt.colorcolumn = "100"  -- Show column marker at 100 chars
opt.showmode = false     -- Don't show mode (lualine shows it)
opt.pumheight = 10       -- Max items in popup menu
opt.pumblend = 10        -- Popup menu transparency

-- Splits
opt.splitright = true    -- Open vertical splits to the right
opt.splitbelow = true    -- Open horizontal splits below
opt.splitkeep = "screen" -- Keep text on screen when splitting

-- Backspace & Editing
opt.backspace = "indent,eol,start" -- Allow backspace on everything in insert mode
opt.virtualedit = "block"          -- Allow cursor to move where there's no text in visual block mode

-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard (y/p work with Cmd+C/Cmd+V)

-- Undo & Backup
opt.undofile = true    -- Persistent undo (survives closing nvim)
opt.undolevels = 10000 -- Maximum number of undos
opt.swapfile = false   -- Disable swap files (annoying .swp files)
opt.backup = false     -- Don't create backup files

-- Performance
opt.updatetime = 200   -- Faster CursorHold events (default 4000ms)
opt.timeoutlen = 300   -- Time to wait for mapped sequence (ms) - good for which-key
opt.lazyredraw = false -- Don't redraw while executing macros (set true if you notice lag)

-- Completion
opt.completeopt = "menu,menuone,noselect" -- Better completion experience
opt.wildmode = "longest:full,full"        -- Command-line completion mode

-- Mouse
opt.mouse = "a"           -- Enable mouse in all modes
opt.mousemoveevent = true -- Enable mouse move events (for some plugins)

-- File handling
opt.fileencoding = "utf-8" -- File encoding
opt.autoread = true        -- Auto reload files changed outside nvim
opt.confirm = true         -- Ask to save instead of erroring

-- Window & Buffer
opt.hidden = true       -- Allow switching buffers without saving
opt.equalalways = false -- Don't resize windows on split/close

-- Formatting (for gq command)
opt.formatoptions = "jcroqlnt" -- See :help fo-table
opt.textwidth = 100            -- Maximum width of text being inserted

-- Fold (using treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99      -- Start with all folds open
opt.foldlevelstart = 99 -- Start with all folds open
opt.foldenable = true   -- Enable folding

-- Fill characters (cleaner look)
opt.fillchars = {
    foldopen = "▾",
    foldclose = "▸",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

-- List characters (show invisible characters)
opt.list = true
opt.listchars = {
    tab = "→ ",
    trail = "·",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
}

-- Grep (use ripgrep if available)
if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep --smart-case"
    opt.grepformat = "%f:%l:%c:%m"
end

-- Disable some built-in plugins we don't need
local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Treesitter highlighting (enable for all filetypes)
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
