require "nvchad.options"

local o = vim.o

vim.opt.shortmess:remove("I")
o.cursorlineopt = 'both' -- to enable cursorline!

o.number = true
o.relativenumber = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.smartindent = true
o.wrap = false

o.swapfile = false
o.backup = false
o.undofile = true

o.updatetime = 50

o.scrolloff = 8
o.hlsearch = true
o.incsearch = true

o.termguicolors = true

-- Custom filetype recognition
vim.filetype.add({
    extension = {
        plot = "gnuplot",
    }
})
