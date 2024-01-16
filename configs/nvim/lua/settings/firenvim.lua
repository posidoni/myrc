(function()
    -- Firenvim config
    -- Firenvim is a browser tool that remotely connects Vim to any buffer.
    -- Really helps with Leetcoding-like things, however has significant overhead
    -- and generally is not expected to be turned on all the time
    vim.cmd([[
		if exists('g:started_by_firenvim')
			au TextChanged * ++nested write
			au TextChangedI * ++nested write
			let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
			let g:EditorConfig_disable_rules = ['']
		endif
	]])
end)()
