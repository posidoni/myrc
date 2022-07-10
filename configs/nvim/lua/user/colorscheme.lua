require("onedark").setup({
	-- Main options --
	style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "bold",
		strings = "italic",
		variables = "none",
	},
	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red

require("onedark").load()

require("doom-one").setup({
	cursor_coloring = true,
	terminal_colors = true,
	italic_comments = true,
	enable_treesitter = true,
	transparent_background = false, -- doesn't work & break things
	pumblend = {
		enable = true,
		transparency_amount = 20,
	},
	plugins_integrations = {
		neorg = true,
		barbar = true,
		bufferline = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		neogit = true,
		nvim_tree = true,
		dashboard = true,
		startify = true,
		whichkey = true,
		indent_blankline = true,
		vim_illuminate = true,
		lspsaga = false,
	},
})
