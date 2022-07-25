-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = "open",
		args = {},
	},
	filters = {
		dotfiles = false, -- false means DO NOT filter dot files (show them)
		custom = {
			"^\\.git",
		},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "s", cb = tree_cb("split") },
				{ key = "t", cb = tree_cb("tabnew") },
				{ key = "ca", cb = tree_cb("copy_absolute_path") },
			},
		},
		number = false,
		relativenumber = false,
		adaptive_size = true, -- resizes window based on the longest line
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			-- @Mikhail: based on my workflow changing dirs feels better off
			-- If the buffer is not inside current tree, DO NOT change tree to this buffer's
			enable = true,
			global = true,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
		},
		open_file = {
			quit_on_open = false, -- @Mikhail: 'true' behaviour feels annoying
			window_picker = {
				enable = false,
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",

		-- @Mikhail: this setting draws lines
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
			},
		},
		-- @Mikhail: special files are underlined
		-- This feature looks absolutely great!
		special_files = {
			"Cargo.toml",
			"build/",
			"Makefile",
			"Dockerfile",
			"CMakeLists.txt",
			"CMakeLists",
		},
	},
})
