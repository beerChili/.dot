local M = {}

M.colors = {
  background = "#181c22",
  foreground = "#9da5b4",
  selection_background = "#3a3f4b",
  selection_foreground = "#ffffff",
  cursor_color = "#abb2bf",

  -- Base colors
  black = "#181c22",       -- Background
  red = "#e06c75",         -- Errors, keywords
  green = "#8fbf70",       -- Strings
  yellow = "#dcb074",      -- Constants, numbers
  blue = "#4fa4e3",        -- Functions, classes
  magenta = "#bb70d2",     -- Keywords, types
  cyan = "#4fb9bd",        -- Variables, parameters
  white = "#9da5b4",       -- Default foreground

  -- Bright colors
  bright_black = "#4b515c", -- Comments
  bright_red = "#e06c75",   -- Same as red
  bright_green = "#8fbf70", -- Same as green
  bright_yellow = "#dcb074",-- Same as yellow
  bright_blue = "#4fa4e3",  -- Same as blue
  bright_magenta = "#bb70d2",-- Same as magenta
  bright_cyan = "#4fb9bd",  -- Same as cyan
  bright_white = "#dfe2e7", -- Brighter white for bold text
}

M.setup = function()
  -- Set background and foreground
  vim.api.nvim_set_hl(0, 'Normal', { bg = M.colors.background, fg = M.colors.foreground })
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = M.colors.selection_background })

  -- Set selection colors
  vim.api.nvim_set_hl(0, 'Visual', { fg = M.colors.selection_foreground, bg = M.colors.selection_background })
  vim.api.nvim_set_hl(0, 'VisualNOS', { fg = M.colors.selection_foreground, bg = M.colors.selection_background })

  -- Set cursor color
  vim.api.nvim_set_hl(0, 'Cursor', { fg = M.colors.foreground, bg = M.colors.cursor_color })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = M.colors.foreground })

  -- Set additional syntax colors (Optional, can be customized further)
  vim.api.nvim_set_hl(0, 'Comment', { fg = M.colors.bright_black })
  vim.api.nvim_set_hl(0, 'String', { fg = M.colors.green })
  vim.api.nvim_set_hl(0, 'Keyword', { fg = M.colors.red })
  vim.api.nvim_set_hl(0, 'Identifier', { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, 'Type', { fg = M.colors.magenta })
  vim.api.nvim_set_hl(0, 'Function', { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, 'Statement', { fg = M.colors.red })
  vim.api.nvim_set_hl(0, 'PreProc', { fg = M.colors.yellow })
  vim.api.nvim_set_hl(0, 'Constant', { fg = M.colors.yellow })

  -- Additional fine-tuning (optional)
  vim.api.nvim_set_hl(0, 'LineNr', { fg = M.colors.bright_black })
  vim.api.nvim_set_hl(0, 'NonText', { fg = M.colors.bright_black })
  vim.api.nvim_set_hl(0, 'SpecialKey', { fg = M.colors.bright_black })
  vim.api.nvim_set_hl(0, 'Todo', { fg = M.colors.bright_yellow })
end

return M

