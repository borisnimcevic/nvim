-- Options for mappings
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- === INSERT MAPPINGS ===
-- Use jk or kj to escape from insert mode to normal mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- === MISC MAPPINGS ===
-- Open netrw with <leader>pv
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- Switch between the last two accessed buffers with <leader><leader>
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts)
