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
}

return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = SERVERS,
        }
    end,
}
