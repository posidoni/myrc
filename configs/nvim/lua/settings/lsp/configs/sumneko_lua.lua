return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
                checkThirdParty = false,
            },
            completion = {
                autoRequire = true,
                postfix = '@',
            },
            format = {
                enable = false,
                defaultConfig = {
                    indent_style = 'space',
                    indent_size = '4',
                    quote_style = 'single',
                    call_arg_parentheses = 'keep',
                    continuation_indent_size = 4,
                    end_of_line = 'auto',
                    align_call_args = true,
                    align_function_define_params = true,
                    keep_one_space_between_table_and_bracket = true,
                    align_table_field_to_first_field = true,
                    continuous_assign_statement_align_to_equal_sign = true,
                    continuous_assign_table_field_align_to_equal_sign = true,
                },
            },
            hint = {
                enable = true,
                arrayIndex = 'auto',
                await = true,
            },
            telemetry = {
                enable = false,
            },
        },
        offsetEncoding = { 'utf-8' },
    },
}
