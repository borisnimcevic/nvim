vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank {higroup=\"IncSearch\", timeout=180}")

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
