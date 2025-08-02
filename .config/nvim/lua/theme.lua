local M = {}

M.colors = {
  background           = "#14171c",
  foreground           = "#9da5b4",
  selection_background = "#3a3f4b",
  selection_foreground = "#ffffff",
  cursor_color         = "#abb2bf",

  -- Base colors
  black   = "#14171c",
  red     = "#e06c75",
  green   = "#8fbf70",
  yellow  = "#dcb074",
  blue    = "#4fa4e3",
  magenta = "#bb70d2",
  cyan    = "#4fb9bd",
  white   = "#9da5b4",

  bright_black = "#4b515c",
  bright_white = "#dfe2e7",
}

function M.setup()
  vim.opt.termguicolors = true

  local highlights = {
    -- Core UI
    Normal        = { fg = M.colors.foreground, bg = M.colors.background },
    CursorLine    = { bg = M.colors.selection_background },
    Visual        = { fg = M.colors.selection_foreground, bg = M.colors.selection_background },
    LineNr        = { fg = M.colors.bright_black },
    Cursor        = { fg = M.colors.foreground, bg = M.colors.cursor_color },
    CursorLineNr  = { fg = M.colors.foreground, bold = true },

    -- Floating windows
    NormalFloat   = { fg = M.colors.foreground, bg = M.colors.background },
    FloatBorder   = { fg = M.colors.selection_background, bg = M.colors.background },

    -- Syntax
    Comment       = { fg = M.colors.bright_black },
    String        = { fg = M.colors.green },
    Keyword       = { fg = M.colors.red },
    Delimiter     = { fg = M.colors.foreground },
    Operator      = { fg = M.colors.foreground },
    Special       = { fg = M.colors.cyan },
    Identifier    = { fg = M.colors.blue },
    Function      = { fg = M.colors.blue },
    Type          = { fg = M.colors.magenta },
    Statement     = { fg = M.colors.red },
    PreProc       = { fg = M.colors.yellow },
    Constant      = { fg = M.colors.yellow },
    ["@variable"] = { fg = M.colors.foreground },

    -- Misc
    Title         = { fg = M.colors.bright_white },
    Todo          = { fg = M.colors.yellow },

    -- Statusline
    StatusLine    = { fg = M.colors.foreground, bg = M.colors.background, bold = true, underline = true },
    StatusLineNC  = { fg = M.colors.bright_black, bg = M.colors.background },
    ModeMsg       = { fg = M.colors.bright_white },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
