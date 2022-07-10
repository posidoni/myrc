local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
	return
end

autosave.setup({
	enabled = true,
	-- execution_message = function()
	--     return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
	-- end,
	execution_message = "",
	events = { "InsertLeave" }, -- this is optimal for performance
	conditions = {
		exists = true,
		filename_is_not = {
			"plugins.lua",
		},
		filetype_is_not = {},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = false,
	clean_command_line_interval = 0,
	-- experiment with this setting
	-- debounce delay is provided in (ms)
	debounce_delay = 1500,
})
