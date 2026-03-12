---@class base46
local onedark = {
  name = 'onedark',
  none = 'NONE',
  yellow = '#e2b86b',
  cyan = '#48b0bd',
  blue = '#4fa6ed',
  darkblue = '#323641', -- bg3
  green = '#8ebd6b',
  orange = '#cc9057',
  violet = '#bf68d9',
  magenta = '#bf68d9',
  red = '#e55561',
  base_30 = {
    base00 = '#0e1013', -- Fundo Principal (black)
    base01 = '#181b20', -- Float background (bg_d)
    base02 = '#1f2329', -- Statusline background (bg0)
    base03 = '#30363f', -- WinSeparator, Border (bg2)
    base04 = '#a0a8b7', -- Statusline foreground (fg)
    base05 = '#a0a8b7', -- Default Foreground (fg)
    base06 = '#8ebd6b', -- Diff Added (green)
    base07 = '#e2b86b', -- Diff Modified (yellow)
    base08 = '#e55561', -- Diff Deleted (red)
    base09 = '#48b0bd', -- Diagnostic Info (cyan)
    base0A = '#e2b86b', -- Diagnostic Warning (yellow)
    base0B = '#e55561', -- Diagnostics Error (red)
    base0C = '#cc9057', -- Markup Bold (blue)
    base0D = '#e2b86b', -- Markup Italic
    base0E = '#bf68d9', -- Markup url
    base0F = '#8ebd6b', -- Markup Inline Code
    base0G = '#4fa6ed', -- Markup Heading 1
    base0H = '#e55561', -- Markup Heading 2
    base0I = '#8ebd6b', -- Markup Heading 3
    base0J = '#bf68d9', -- Markup Heading 4
    base0K = '#4fa6ed', -- Markup Heading 5
    base0L = '#e2b86b', -- Markup Heading 6
    base0M = '#4fa6ed', -- Markup Tag
    base0N = '#48b0bd', -- Markup Tag Attribute
    base0O = '#4fa6ed', -- Markup Tag Delimiter
    base0P = '#bf68d9', -- Pmenu Background (bg_d)
    base0Q = '#bf68d9', -- Folder Background
    base0R = '#4fa6ed', -- Cursor Color
    base0S = '#4fa6ed', -- Accent
    base0T = '#e2b86b', -- Title
  },

  base_16 = {
    base00 = '#535965', -- LineNr (grey)
    base01 = '#282c34', -- Lighter Background (bg1)
    base02 = '#323641', -- Selection (bg3)
    base03 = '#7a818e', -- Comments (light_grey)
    base04 = '#a0a8b7', -- Variable Parameter (fg)
    base05 = '#a0a8b7', -- Caret, Delimiters
    base06 = '#a0a8b7', -- Property
    base07 = '#bf68d9', -- PreProc (purple)
    base08 = '#e55561', -- Variables (red)
    base09 = '#cc9057', -- Integers/Boolean (orange)
    base0A = '#e2b86b', -- Classes (yellow)
    base0B = '#8ebd6b', -- Strings (green)
    base0C = '#48b0bd', -- Support/Regex (cyan)
    base0D = '#4fa6ed', -- Functions (blue)
    base0E = '#bf68d9', -- Keywords (purple)
    base0F = '#8b3434', -- Deprecated (dark_red)
  },
  groups = {
    DiffAdd = { bg = '#272e23', fg = 'NONE' },
    DiffDelete = { bg = '#2d2223', fg = 'NONE' },
    DiffChange = { bg = '#172a3a', fg = 'NONE' },
    DiffText = { bg = '#274964', fg = 'NONE' },
  },
}

local base46 = require 'base46'
base46.load_theme(onedark)
