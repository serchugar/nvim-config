-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    transparency = false,

    hl_override = {
        Comment = { italic = true, fg = "#9f9f9f" },
        ["@comment"] = { italic = true, fg = "#9f9f9f" },

        LineNr = { fg = "#009190" },
        CursorLineNr = { fg = "#00fffb" },
    },
}

M.term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.4, vsp = 0.3, ["bo sp"] = 0.4, ["bo vsp"] = 0.3 },
    float = {
        relative = "editor",
        row = 0.1,
        col = 0.09,
        width = 0.8,
        height = 0.7,
        border = "rounded",
        style = "minimal",
    },
}

M.ui = {
    statusline = {
        separator_style = "round",
        modules = {
            custom_date = function()
                ---@type string -- Tell LSP that this retunrs a string, and not a string|osdate
                return os.date "|  %H:%M   %d-%m-%Y " or ""
            end,
        },
        order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "custom_date", "cwd", "cursor" },
    },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
