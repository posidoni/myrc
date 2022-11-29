return {
    settings = {
        gopls = {
            gofumpt = true,
            hints = {
                compositeLiteralFields = true,
                assignVariableTypes = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            annotations = {
                bounds = true,
                escape = true,
                inline = true,
            },
            analyses = {
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
                fieldalignment = true,
                httpresponse = true,
                ifaceassert = true,
                loopclosure = true,
                lostcancel = true,
                shadow = true,
                unusedparams = true,
                unusedwrite = true,
                unusedvariable = true,
            }
        },
        staticcheck = true,
    }
}
