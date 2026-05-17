-- Own custom floating terminal module
-- Functions used in mappings.lua

local utils = require("serchugar.utils.functions")

local M = {}

local bufnr = nil
local floatWindowOpts = nil

local function get_float_opts()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.75)
    return {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2) - 2, -- Translate window 2 row up
        col = math.floor((vim.o.columns - width) / 2),
        style = 'minimal',
        border = 'rounded'
    }
end

function M.OpenFloat()
    floatWindowOpts = get_float_opts()
    if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
        bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_open_win(bufnr, true, floatWindowOpts)

        vim.api.nvim_command('term')
        if utils.isWindowsOs() then
            vim.fn.chansend(vim.api.nvim_get_option_value("channel", { buf = bufnr }), "cls\r")
        else
            vim.fn.chansend(vim.api.nvim_get_option_value("channel", { buf = bufnr }), "clear\r")
        end

    elseif vim.api.nvim_get_current_buf() ~= bufnr then
        vim.api.nvim_open_win(bufnr, true, floatWindowOpts)
    end
    vim.api.nvim_command('startinsert')
end

function M.Hide()
    local currentBufnr = vim.api.nvim_get_current_buf()
    if vim.bo[currentBufnr].buftype == "terminal" then
        local winId = vim.fn.bufwinid(currentBufnr)
        if winId ~= -1 then -- ==-1 means buffer is not displayed in any window
            if vim.api.nvim_win_get_config(winId).relative ~= '' then -- If relative is not empty means its floating
                vim.api.nvim_win_hide(winId)

                -- Exit insert mode of beneath term if float term window is hidden on top of another regular terminal window
                local key = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true)
                vim.api.nvim_feedkeys(key, 't', false)
            else
                -- Exit insert mode instead of hidding if term window is not floating
                local key = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true)
                vim.api.nvim_feedkeys(key, 't', false)
            end
        end
    end
end

local function ResizeFloat()
    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
        local winId = vim.fn.bufwinid(bufnr)
        if winId ~= -1 then
            floatWindowOpts = get_float_opts()
            vim.api.nvim_win_set_config(winId, floatWindowOpts)
        end
    end
end

vim.api.nvim_create_augroup("CustomTerminalGroup", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    group = "CustomTerminalGroup",
    callback = function() ResizeFloat() end,
})

return M
