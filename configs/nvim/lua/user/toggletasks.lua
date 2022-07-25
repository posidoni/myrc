require("telescope").load_extension("toggletasks")

local homeTasks = os.getenv("HOME") .. "/.config/nvim/tasks"

require("toggletasks").auto_spawn({ "VimEnter", "SessionLoadPost" }, function(tasks)
	return tasks:with_tag("auto"):not_tag("test"):from_file(homeTasks):filter(function(task)
		return task.config.name ~= "Hello world"
	end)
end)

require("toggletasks").setup({
	debug = false,
	silent = false, -- don't show "info" messages
	short_paths = true, -- display relative paths when possible
	-- Paths (without extension) to task configuration files (relative to scanned directory)
	-- All supported extensions will be tested, e.g. '.toggletasks.json', '.toggletasks.yaml'
	search_paths = {
		"toggletasks",
		".toggletasks",
		".nvim/toggletasks",
		".nvim/",
		"../.nvim/",
	},
	-- Directories to consider when searching for available tasks for current window
	scan = {
		global_cwd = true, -- vim.fn.getcwd(-1, -1)
		tab_cwd = true, -- vim.fn.getcwd(-1, tab)
		win_cwd = true, -- vim.fn.getcwd(win)
		lsp_root = true, -- root_dir for first LSP available for the buffer
		dirs = {
			homeTasks,
		}, -- explicit list of directories to search
	},
	-- Language server priorities when selecting lsp_root (default is 0)
	lsp_priorities = {
		["null-ls"] = -10,
	},
	-- Default values for task configuration options (available options described later)
	defaults = {
		close_on_exit = false,
		hidden = true,
	},
	-- Configuration of telescope pickers
	telescope = {
		spawn = {
			open_single = true, -- auto-open terminal window when spawning a single task
			show_running = false, -- include already running tasks in picker candidates
			-- Replaces default select_* actions to spawn task (and change toggleterm
			-- direction for select horiz/vert/tab)
			mappings = {
				select_float = "<nop>",
				spawn_smart = "<nop>", -- all if no entries selected, else use multi-select
				spawn_all = "<nop>", -- all visible entries
				spawn_selected = "<nop>", -- entries selected via multi-select (default <tab>)
			},
		},
		-- Replaces default select_* actions to open task terminal (and change toggleterm
		-- direction for select horiz/vert/tab)
		select = {
			mappings = {
				select_float = "<nop>",
				open_smart = "<nop>",
				open_all = "<nop>",
				open_selected = nil,
				kill_smart = "<nop>",
				kill_all = "<nop>",
				kill_selected = nil,
				respawn_smart = "<nop>",
				respawn_all = "<nop>",
				respawn_selected = nil,
			},
		},
	},
})
