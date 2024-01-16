local status_ok, onedarkModule = pcall(require, 'onedarkpro')
if not status_ok then
    vim.notify('failed to load onedark pro colorscheme', vim.log.levels.ERROR)
    return
end

local config = {
    styles = {
        types = 'NONE',
        methods = 'NONE',
        numbers = 'NONE',
        strings = 'NONE',
        comments = 'italic',
        keywords = 'bold',
        constants = 'NONE',
        functions = 'bold',
        operators = 'NONE',
        variables = 'NONE',
        parameters = 'NONE',
        conditionals = 'bold',
        virtual_text = 'NONE',
    },
    plugins = { -- Override which plugin highlight groups are loaded
        aerial = true,
        barbar = true,
        copilot = true,
        dashboard = true,
        flash_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = true,
        mini_indentscope = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        op_nvim = true,
        packer = true,
        polygot = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
    },
    highlights = {
        Comment = { italic = true, extend = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
    },
    options = {
        cursorline = true,                  -- Use cursorline highlighting?
        transparency = false,               -- Use a transparent background?
        terminal_colors = true,             -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
}


local function setupThemeFn()
    onedarkModule.setup(config)
    vim.cmd [[ colorscheme onedarkpro ]]
end
