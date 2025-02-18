local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- standart
keymap("n", "<C-t>", "<cmd>tabnew %<CR>", opts)
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- navigation buffer
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)

-- Nvim Tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
