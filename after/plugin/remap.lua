local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- open netrw
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- easier window navigation
vim.g.tmux_navigator_no_mappings = 1
nnoremap("<C-h>", ":TmuxNavigateLeft<cr>")
nnoremap("<C-j>", ":TmuxNavigateDown<cr>")
nnoremap("<C-k>", ":TmuxNavigateUp<cr>")
nnoremap("<C-l>", ":TmuxNavigateRight<cr>")

-- easier tab navigation
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Unmap
nnoremap("<S-j>", "<Nop>")
vnoremap("<S-j>", "<Nop>")
nnoremap("<Space>", "<Nop>")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- -- Light version
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- -- Normal --
-- Resize with arrows
keymap("n", "<S-C-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-C-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert an empty line
keymap("n", "<CR>", "o<ESC>", opts)

-- Insert --
-- Press jk fast to exit
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visua --
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Test remaps
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", opts)
-- vim.keymap.set("n","<leader>f",vim.lsp.buf.format, {buffer = 0})
