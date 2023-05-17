local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- Map Telescope functions
-- Search for files in the current directory
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search for files in the git repository
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Grep for a string in the current directory
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- Search for Vim help tags
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Configure Telescope
telescope.setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- Enable fuzzy searching
      override_generic_sorter = true,  -- Override the generic sorter
      override_file_sorter = true,     -- Override the file sorter
      case_mode = "smart_case",        -- Use smart case for case sensitivity
    }
  }
}

-- Load the FZF extension if it's installed
if not pcall(function() telescope.load_extension('fzf') end) then
  print("Failed to load the FZF extension for Telescope")
end

