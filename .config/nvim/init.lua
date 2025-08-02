-- Disable mouse and arrow keys to encourage using Vim navigation
local function nav_msg()
    vim.cmd("echo 'Use hjkl for navigation!'")
end
vim.keymap.set({ "n", "i", "v" }, "<Up>",    nav_msg, { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Down>",  nav_msg, { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Left>",  nav_msg, { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Right>", nav_msg, { silent = true })
vim.o.mouse = ""

-- Set space as the leader key for all mappings
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Navigation & usability improvements
vim.wo.number         = true
vim.wo.relativenumber = true
vim.o.scrolloff       = 10    -- Keeps cursor at least 10 lines from edge of screen
vim.o.wrap            = false -- Disable line wrapping
vim.o.splitbelow      = true  -- Horizontal splits open below the current window
vim.o.splitright      = true  -- Vertical splits open to the right of the current window
vim.o.signcolumn      = "yes" -- Avoids changing layout in case of lsp feedback

vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable auto-indentation and set tab behavior to spaces
vim.o.autoindent  = true -- Automatically indent new lines
vim.o.expandtab   = true -- Use spaces instead of tabs
vim.o.shiftwidth  = 4    -- Set indentation width for > and < commands
vim.o.tabstop     = 4    -- Set the number of spaces a tab represents
vim.o.softtabstop = 4    -- Set number of spaces inserted when pressing <Tab> in insert mode

vim.cmd("filetype plugin indent on")

-- Search settings for better usability
vim.o.ignorecase = true      -- Ignore case when searching
vim.o.smartcase  = true      -- Override ignorecase if search pattern has uppercase letters
vim.o.incsearch  = true      -- Show matches as you type
vim.o.hlsearch   = true      -- Highlight search results
vim.o.inccommand = 'nosplit' -- Live preview substitution changes in-place

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlight on Escape

-- Improve performance and responsiveness
vim.o.lazyredraw  = true -- Only redraw screen when necessary (improves performance)
vim.o.ttimeoutlen = 100  -- Time in ms to wait for follow-up after pressing ESC
vim.o.updatetime  = 300  -- Time in ms before triggering autocommands (e.g., for linting)
vim.o.timeoutlen  = 500  -- Time in ms for key sequence to be considered timed out

-- --- Miscellaneous Settings ---
-- Enable system clipboard access
vim.keymap.set("n", "<leader>y", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')

-- Disable backup and swap files for cleaner file management
vim.o.backup   = false
vim.o.swapfile = false

-- Persist undo history
vim.o.undofile = true

-- --- Appearance & Theme ---
vim.cmd("syntax on")
require('theme').setup()

vim.o.cursorline = true
vim.o.winborder  = "bold"

-- --- LSP ---
vim.cmd("set completeopt+=noselect")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zig",
  callback = function()
    local root = vim.fs.find({ "build.zig", ".git" }, { upward = true })[1]
    local root_dir = root and vim.fs.dirname(root) or vim.loop.cwd()

    vim.lsp.start({
      name = "zls",
      cmd = { "zls" },
      root_dir = root_dir,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,     { buffer = true })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,    { buffer = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references,     { buffer = true })

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,      { buffer = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,      { buffer = true })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true })
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = true })

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = true })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,         { buffer = true })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,         { buffer = true })
  end,
})

