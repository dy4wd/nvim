return {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = { "ensure_installed" },
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "css",
            "html",
            "javascript",
            "json",
            "lua",
            "vim",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "tsx",
            "typescript",
        },
        sync_install = false,
        auto_install = true,
        ignore_install = { "" },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
