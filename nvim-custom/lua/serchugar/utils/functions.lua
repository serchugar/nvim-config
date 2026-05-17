local M = {}

function M.custom_lsp_format(client)
    -- Custom format for clangd
    if client.name == "clangd" then
        local filepath = vim.fn.getcwd() .. "/.clang-format"
        local file = io.open(filepath, "r")

        if not file then
            file = io.open(filepath, "w")
            if file then
                file:write("IndentWidth: 4")
                file:close()
                vim.lsp.buf.format()
                os.remove(filepath)
            end
        else -- if .clang-format file exists, use those settings
            vim.lsp.buf.format()
        end

    -- Default format for rest lsp
    else
        vim.lsp.buf.format()
    end
end

function M.isWindowsOs()
    return vim.uv.os_uname().sysname:match "Windows"
end

return M
