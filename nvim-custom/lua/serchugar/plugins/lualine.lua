local utils = require("serchugar.utils.functions")
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            globalstatus = true,
            always_show_tabline = true,
            disabled_filetypes = {
                winbar = {
                    "dap-repl",
                    "dapui_console",
                    "oil",
                },
            },
        },
        sections = {
            lualine_c = { { "filename", file_status = true, path = 1, } },
            lualine_x = { "fileformat", "encoding", "filetype" },
        },
        inactive_winbar = {
            lualine_c = { { "filename", color = {bg = "none" , fg = "#ffffff" } } },
        },
        winbar = {
            lualine_c = { {"filename" , color = {bg = "none", fg = "#4cdce1"} } },
        },
        tabline = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { function()
                if utils.isWindowsOs() then
                    return vim.fn.getcwd():match("([^\\]+)$")
                else
                    return vim.fn.getcwd():match("([^/]+)$")
                end
            end },
            lualine_x = { { "datetime", style = "%H:%M:%S" }, { "datetime", style = "%d-%m-%Y" } },
            lualine_y = {},
            lualine_z = {}
        },
    },
}
