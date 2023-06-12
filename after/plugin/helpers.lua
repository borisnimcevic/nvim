function _G.Close_all_buffers_except_current()
    local current_buf = vim.api.nvim_get_current_buf()
    local all_bufs = vim.api.nvim_list_bufs()

    for _, buf in ipairs(all_bufs) do
        if buf ~= current_buf then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end
