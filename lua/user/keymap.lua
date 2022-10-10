local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

return M

-- -- formatting
-- -- there needs to be some guard about running this only if the file ist .rs
-- -- also, maybe run this automatically if on saving the file
-- keymap("n", "<leader>f", ":%!rustfmt <cr>", opts) -- format the current file in rust
