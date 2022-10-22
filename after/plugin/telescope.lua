-- vim.keymap.set("n","<C-p>","<cmd>Telescope find_files<CR>", {buffer = 0})
vim.keymap.set("n","<C-p>","<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
vim.keymap.set("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
