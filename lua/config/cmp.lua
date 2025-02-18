local cmp = require "cmp"
local types = require "cmp.types"
local luasnip = require "luasnip"

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip").filetype_extend("typescriptreact", { "html" })

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping(
            cmp.mapping.select_prev_item {
                behavior = types.cmp.SelectBehavior.Select,
            },
            { "i", "c" }
        ),
        ["<C-j>"] = cmp.mapping(
            cmp.mapping.select_next_item {
                behavior = types.cmp.SelectBehavior.Select,
            },
            { "i", "c" }
        ),
        ["<C-h>"] = function()
            if cmp.visible_docs() then
                cmp.close_docs()
            else
                cmp.open_docs()
            end
        end,
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                require("neotab").tabout()
            else
                require("neotab").tabout()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
}
