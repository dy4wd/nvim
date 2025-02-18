local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

local SERVERS = {
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "ts_ls",
    "marksman",
    "pyright",
    "stylelint_lsp",
    "lua_ls",
}

for _, server in pairs(SERVERS) do
    local opts = { capabilities = cmp_nvim_lsp.default_capabilities() }
    local require_ok, settings =
        pcall(require, "config.lsp-settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
    end
    lspconfig[server].setup(opts)
end
