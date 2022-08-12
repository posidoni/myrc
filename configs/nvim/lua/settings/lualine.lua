local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local diff = {
	"diff",
	source = diff_source,
	symbols = { added = "  ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	cond = nil,
}

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str .. " "
	end,
}

local filename = {
	"filename",
	file_status = false, -- Displays file status (readonly status, modified status)
	path = 3, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path
	-- 3: Absolute path, with tilde as the home directory
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
	},
}

local filetype = {
	"filetype",
	colores = true,
	icons_enabled = true,
	icon_only = false, -- Display only an icon for filetype
	icon = { align = "right" }, -- Display filetype icon on the right hand side
}

-- local fileformat = {
--     'fileformat',
--     symbols = {
--         unix = '',
--         dos = '',
--         mac = '',
--     }
-- }

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		-- theme = "palenight", -- theme for doom-one
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline", "qf" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { filename, diagnostics },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { diagnostics, diff, filetype },
		lualine_z = { location },
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {}, -- doesn't provide anything useful, just changes lualine slightly for specified extensions-buffers. Don't recomment turning on any.
})
