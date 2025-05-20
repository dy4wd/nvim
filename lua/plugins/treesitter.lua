return {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = { "ensure_installed" },
    opts = {
        ensure_installed = {
            "css",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
        },
        sync_install = false,
        auto_install = true,
        ignore_install = { "" },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
