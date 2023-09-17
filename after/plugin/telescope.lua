local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')  -- Added this line

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

-- Open a list of buffers
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })


-- Configure Telescope
telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-x>"] = function(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd('bdelete ' .. selection.bufnr)
                end,
            },
            n = {
                ["<C-x>"] = function(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd('bdelete ' .. selection.bufnr)
                end,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,             -- Enable fuzzy searching
            override_generic_sorter = true, -- Override the generic sorter
            override_file_sorter = true, -- Override the file sorter
            case_mode = "smart_case", -- Use smart case for case sensitivity
        }
    }
}

-- Load the FZF extension if it's installed
if not pcall(function() telescope.load_extension('fzf') end) then
    print("Failed to load the FZF extension for Telescope")
end
