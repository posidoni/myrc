local ok, illuminate = pcall(require, 'illuminate')
if not ok then
    vim.notify('Failed to load illuminate', 'error')
end

-- default configuration
illuminate.configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 120,
    filetype_overrides = {},
    filetypes_denylist = {
        'dropbar_menu',
        'dirvish',
        'fugitive',
        'alpha',
        'NvimTree',
        'packer',
        'neogitstatus',
        'Trouble',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'DressingSelect',
        'TelescopePrompt',
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})
