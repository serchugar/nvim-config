require "nvchad.mappings"

local map = vim.keymap.set
local base46 = require "base46"

map("n", "<leader>tt", function()
    base46.toggle_transparency()
end)

map("n", "<leader>e", "<cmd>Oil<CR>", { desc = "start oil explorer in floating window" })

map("n", "<leader>co", function()
    require("telescope.builtin").find_files {
        cwd = vim.fn.stdpath "config",
        hidden = false,
    }
end, { desc = "Telescope find ~/.config/ files" })
