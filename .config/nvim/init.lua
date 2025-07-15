-- Disable mouse and arrow keys to encourage using Vim navigation
vim.opt.mouse = ""
for _, mode in ipairs({ "n", "i", "v" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    vim.keymap.set(mode, key, function()
      -- Display message if arrow keys are pressed
      vim.cmd("echo 'Use hjkl for navigation!'")
    end, { silent = true })
  end
end

-- Set space as the leader key for all mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation & usability improvements
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.scrolloff = 10    -- Keeps cursor at least 10 lines from edge of screen
vim.opt.wrap = false      -- Disable line wrapping
vim.opt.showmatch = true  -- Highlight matching parentheses
vim.opt.splitbelow = true -- Horizontal splits open below the current window
vim.opt.splitright = true -- Vertical splits open to the right of the current window

vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable auto-indentation and set tab behavior to spaces
vim.opt.autoindent = true -- Automatically indent new lines
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 4    -- Set indentation width for > and < commands
vim.opt.tabstop = 4       -- Set the number of spaces a tab represents
vim.opt.softtabstop = 4   -- Set number of spaces inserted when pressing <Tab> in insert mode

vim.cmd("filetype plugin indent on")

-- Search settings for better usability
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Override ignorecase if search pattern has uppercase letters
vim.opt.incsearch = true  -- Show matches as you type
vim.opt.inccommand = 'nosplit' -- Live preview substitution changes in-place
vim.opt.hlsearch = true   -- Highlight search results
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlight on Escape

-- Improve performance and responsiveness
vim.opt.lazyredraw = true -- Only redraw screen when necessary (improves performance)
vim.opt.ttimeoutlen = 100 -- Time in ms to wait for follow-up after pressing ESC
vim.opt.updatetime = 300  -- Time in ms before triggering autocommands (e.g., for linting)
vim.opt.timeoutlen = 500  -- Time in ms for key sequence to be considered timed out

-- --- Miscellaneous Settings ---
-- Enable system clipboard access
vim.opt.clipboard = "unnamedplus"

-- Disable backup and swap files for cleaner file management
vim.opt.backup = false
vim.opt.swapfile = false

-- Persist undo history
vim.opt.undofile = true

-- --- Appearance & Theme ---
vim.cmd("syntax on")
vim.opt.termguicolors = true

require('theme').setup()

vim.opt.cursorline = true

vim.opt.guicursor = {
  "i:blinkon1", -- Cursor in insert mode (blinking)
  "i-ci:ver12", -- Cursor in insert mode (vertical, 2 pixels thick)
  "r-cr:hor12", -- Cursor in replace mode (horizontal, 2 pixels thick)
}
