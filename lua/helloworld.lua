local M = {}

-- Setup function (for any configuration you might want to add later)
M.setup = function()
    vim.notify("Hello from the plugin!")
    -- Set highlight for our popup
    vim.api.nvim_set_hl(0, "HelloWorldPopup", { fg = "#ffffff", bg = "#af4c61", bold = true })
end

-- Function to create and show popup
M.show_popup = function()
    -- Create a floating window
    local buf = vim.api.nvim_create_buf(false, true)
    local width = 20
    local height = 3
    -- Calculate center of screen
    local ui = vim.api.nvim_list_uis()[1]
    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width - width) / 2)
    -- Set buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        "┌──────────┐",
        "│   Hi!    │",
        "└──────────┘"
    })

    -- Set window options
    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'none'
    }

    -- Create the window
    local win = vim.api.nvim_open_win(buf, true, opts)
    -- Apply highlighting
    vim.api.nvim_win_set_option(win, 'winhl', 'Normal:HelloWorldPopup')
    -- Close on any key press
    vim.keymap.set('n', '<Esc>', function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, noremap = true })
end

return M
