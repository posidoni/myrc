local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local luadev = require("lua-dev").setup({})

lspconfig.sumneko_lua.setup(luadev)
require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
