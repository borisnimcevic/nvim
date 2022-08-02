local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- open netrw
nnoremap("<leader>pv","<cmd>Ex<CR>")

-- easier window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Unmap
nnoremap("J","<Nop>")
nnoremap("<Space>", "<Nop>")
