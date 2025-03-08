return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
        })
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<S-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(),
            {
                title = " Harpoon ",
                border = "rounded",
                title_pos = "center",
            })
        end)

        vim.keymap.set("n", "<S-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<S-t>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<S-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<S-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
}
