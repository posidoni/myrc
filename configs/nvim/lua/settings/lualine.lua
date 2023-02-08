local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
    symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌶 ' },
    colored = true,
    update_in_insert = false,
    always_visible = false,
}

local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    purple = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67',
}

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local diff = {
    'diff',
    source = diff_source,
    symbols = { added = '  ', modified = '󰘧 ', removed = '  ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.blue },
        removed = { fg = colors.red },
    },
    cond = nil,
}

local mode = {
    'mode',
    padding = 3,
}

local filename = {
    'filename',
    file_status = false,  -- Displays file status (readonly status, modified status)
    path = 3,
    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
    },
}

local filetype = {
    'filetype',
    colores = true,
    icons_enabled = true,
    icon_only = false,          -- Display only an icon for filetype
    icon = { align = 'right' }, -- Display filetype icon on the right hand side
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
}

local location = {
    'location',
    padding = 1,
}

local function get_attached_clients()
    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
    if #buf_clients == 0 then
        return "LSP ∅"
    end

    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
        if client.name ~= "copilot" and client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
    end

    local null_ls_s, null_ls = pcall(require, "null-ls")
    if null_ls_s then
        local sources = null_ls.get_sources()
        for _, source in ipairs(sources) do
            if source._validated then
                for ft_name, ft_active in pairs(source.filetypes) do
                    if ft_name == buf_ft and ft_active then
                        table.insert(buf_client_names, source.name)
                    end
                end
            end
        end
    end

    -- Add formatters (from formatter.nvim)
    local formatter_s, _ = pcall(require, "formatter")
    if formatter_s then
        local formatter_util = require("formatter.util")
        for _, formatter in ipairs(formatter_util.get_available_formatters_for_ft(buf_ft)) do
            if formatter then
                table.insert(buf_client_names, formatter)
            end
        end
    end



    local unique_client_names = {}
    for _, client_name_target in ipairs(buf_client_names) do
        unique_client_names[client_name_target] = true
    end

    local name_mappings = {
        ['golangci_lint_ls'] = 'golangci_lint',
        ['golangci_lint'] = 'golangci_lint',
        ['goimports_reviser'] = 'goimports',
    }

    local str = {}
    for client, _ in pairs(unique_client_names) do
        local mapping = name_mappings[client]
        if not mapping then
            table.insert(str, client)
        else
            table.insert(str, mapping)
        end
    end

    local client_names_str = table.concat(str, ", ")
    local language_servers = string.format("[%s]", client_names_str)

    return language_servers
end

local attached_clients_section = {
    get_attached_clients,
    color = {
        gui = "bold"
    }
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'dashboard', 'Outline', 'qf' },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, },
        lualine_c = { diagnostics, },
        lualine_y = { attached_clients_section, diff, filetype },
        lualine_z = { location },
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
