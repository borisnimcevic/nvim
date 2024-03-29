vim.g.mapleader = " "

local options = {
  -- backup files
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  -- numbers
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  -- numberwidth = 2,                         -- set number column width to 2 {default 4}

  -- everything smart
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again

  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  softtabstop = 4,
  tabstop = 4,                             -- insert 2 spaces for a tab
  cursorline = false,                      -- highlight the current line
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- [false] display lines as one long line, [true] wrap the line
  scrolloff = 8,                           -- space between the cursos and the edge of the screen when the sceen starts scrolling
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

  vim.opt.shortmess:append("c")


for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.nrformats:append("alpha")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove("cro")
