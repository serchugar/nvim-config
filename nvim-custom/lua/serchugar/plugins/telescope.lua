return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
            '<leader>ff',
            function()
                require("telescope.builtin").find_files()
            end,
            mode = "n",
            desc = 'Telescope find files'
        },
        {
            '<C-p>',
            function()
                require("telescope.builtin").git_files()
            end,
            mode = "n",
            desc = 'Telescope git files'
        },
        {
            '<leader>fs',
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            mode = "n",
            desc = "Telescope search files"
        },
        {
            '<leader>fh',
            function()
                require("telescope.builtin").help_tags()
            end,
            mode = "n",
            desc = 'Telescope help'
        },
        {
            '<leader>co',
            function()
                require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
            end,
            mode = "n",
            desc = 'Telescope find ~/.config/ files'
        },
        {
            '<leader>fg',
            function()
                require("telescope.builtin").live_grep()
            end,
            mode = "n",
            desc = 'Telescope live grep'
        },
        {
            '<leader>fc',
            function()
                require("telescope.builtin").git_status()
            end,
            mode = "n",
            desc = 'Telescope git changes'
        },
    },
}

