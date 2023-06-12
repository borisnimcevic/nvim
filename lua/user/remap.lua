-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Options for mappings
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- === WINDOW NAVIGATION ===
-- Disable tmux navigator's default mappings
vim.g.tmux_navigator_no_mappings = 1

-- Use Ctrl+h/j/k/l to navigate between windows
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>")

-- Resize windows using Shift+Ctrl+arrows
vim.keymap.set("n", "<S-C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-C-Right>", ":vertical resize +2<CR>", opts)

-- === BUFFER NAVIGATION ===
-- Navigate between buffers with Shift+h/l
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- Navigate within buffer lines with j/k
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Scroll half a page down/up and recenter screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- === TERMINAL NAVIGATION ===
-- Navigate between terminal windows using Ctrl+h/j/k/l
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- === LSP ===
-- Format buffer using lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Toggle between source and header file
vim.keymap.set("n", "<leader>s", ":ClangdSwitchSourceHeader<CR>")

-- === MISC MAPPINGS ===
-- Open netrw with <leader>pv
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- Toggle relative line numbers with <leader>n
vim.keymap.set("n", "<leader>n", ":set relativenumber!<CR>", opts)

-- Clear search highlighting with <leader>h
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Save file with Ctrl+s
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Switch between the last two accessed buffers with <leader><leader>
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts)

-- Delete buffer with <leader>bd
vim.keymap.set("n", "<leader>bd", ":bd<CR>", opts)

-- Toggle NERDTree
vim.keymap.set("n", "<leader>t", ":NERDTreeToggle<CR>", opts)
-- === UNMAP ===
-- Disable the default mapping for Shift+j
vim.keymap.set("n", "<S-j>", "<Nop>")
vim.keymap.set("v", "<S-j>", "<Nop>")

-- Disable the default mapping for Space
vim.keymap.set("n", "<Space>", "<Nop>")

-- Disable the default mapping for Q
vim.keymap.set("n", "Q", "<nop>")

-- === NORMAL MAPPINGS ===
-- Insert an empty line below the current line with Enter
vim.keymap.set("n", "<CR>", "o<ESC>", opts)

-- The following it to restore the basic function in normal mode if
-- the position is in the quick fix list
function qf_mappings()
    local buf = vim.api.nvim_get_current_buf()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "<CR>", opts)
end

vim.api.nvim_exec([[
  autocmd FileType qf lua qf_mappings()
]], false)

-- === INSERT MAPPINGS ===
-- Use jk or kj to escape from insert mode to normal mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- === VISUAL MAPPINGS ===
-- Use p to paste and replace selected text
vim.keymap.set("v", "p", '"_dP', opts)
