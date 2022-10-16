local root_files = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
}

local function organize_imports()
    local params = {
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(0) },
    }
    vim.lsp.buf.execute_command(params)
end

return {
    settings = {
        cmd = cmd,
        filetypes = { 'python' },
        root_dir = util.root_pattern(unpack(root_files)),
        single_file_support = true,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'workspace',
                },
            },
        },
    },
    commands = {
        PyrightOrganizeImports = {
            organize_imports,
            description = 'Organize Imports',
        },
    },
}
