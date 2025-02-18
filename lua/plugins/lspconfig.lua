local ICONS = require "config.icons"

return {
    "neovim/nvim-lspconfig",
    keys = {
        {
            "gl",
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            desc = "Opens a floating diagnostic window",
        },
    },
    init = function()
        vim.diagnostic.config {
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ICONS.diagnostics.Error,
                    [vim.diagnostic.severity.WARN] = ICONS.diagnostics.Warning,
                    [vim.diagnostic.severity.HINT] = ICONS.diagnostics.Hint,
                    [vim.diagnostic.severity.INFO] = ICONS.diagnostics.Information,
                },
            },
            virtual_text = false,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                header = "",
                prefix = "",
            },
        }
    end,
}
