return {
    settings = {
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        gopls = {
            buildFlags = {
                '-tags=e2e,integration',
            },
            completionDocumentation = true,
            gofumpt = true,
            ['local'] = 'gitlab.com/gotbitio,go.avito.ru,github.com,gitlab.com',
            completeUnimported = true,
            codelenses = {
                generate = true,
                gc_details = true,
                tidy = true,
                vendor = true,
            },
            annotations = {
                bounds = true,
                escape = true,
                inline = true,
                ['nil'] = true,
            },
            vulncheck = 'Imports',
            hoverKind = 'FullDocumentation',
            linksInHover = false,
            analyses = {
                stubmethods = true,
                unreachable = true,
                assign = true,
                atomic = true,
                bools = true,
                atomicalign = true,
                buildtag = true,
                cgocalls = true,
                composites = true,
                copylocks = true,
                deepequalerrors = true,
                embed = true,
                errorsas = true,
                httpresponse = true,
                ifaceassert = true,
                loopclosure = true,
                lostcancel = true,
                fieldalignment = false, -- should be optimized only in very specific cases.
                shadow = false,
                unusedparams = true,
                useany = true,
                unusedwrite = true,
                unusedvariable = true,
            },
            staticcheck = true,
            experimentalPostfixCompletions = false,
            hints = {
                enabled = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}
