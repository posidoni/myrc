-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Load nvim color scheme:
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
require('onedark').setup {
    style = 'deep',
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold',
        strings = 'italic',
        variables = 'none'
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
require('onedark').load()

local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_deep = {
		black = "#0c0e15",
		bg = "#1a212e",
		bg1 = "#21283b",
		bg2 = "#283347",
		bg3 = "#2a324a",
		bg_d = "#141b24",
		bg_blue = "#54b0fd",
		bg_yellow = "#f2cc81",
		fg = "#93a4c3",
		purple = "#c75ae8",
		green = "#8bcd5b",
		orange = "#dd9046",
		blue = "#41a7fc",
		yellow = "#efbd5d",
		cyan = "#34bfd0",
		red = "#f65866",
		grey = "#455574",
		light_grey = "#6c7d9c",
		dark_cyan = "#1b6a73",
		dark_red = "#992525",
		dark_yellow = "#8f610d",
		dark_purple = "#862aa1",
		diff_add = "#27341c",
		diff_delete = "#331c1e",
		diff_change = "#102b40",
	diff_text = "#1c4a6e",
}

return M
