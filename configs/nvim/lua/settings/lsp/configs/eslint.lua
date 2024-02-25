local lspconfig = require('lspconfig')

return {
    root_dir = lspconfig.util.root_pattern(
        'tsconfig.base.json',
        '.eslintrc.json',
        '.eslint*'
    ),
    codeAction = {
        disableRuleComment = {
            enable = true,
            location = 'separateLine',
        },
        showDocumentation = {
            enable = true,
        },
    },
    codeActionOnSave = {
        enable = true,
        mode = 'all',
    },
    format = {
        enable = true,
    },
    nodePath = '',
    onIgnoredFiles = 'off',
    packageManager = 'npm',
    quiet = false,
    rulesCustomizations = {},
    run = 'onType',
    useESLintClass = false,
    validate = 'on',
    workingDirectory = {
        mode = 'location',
    },
}
