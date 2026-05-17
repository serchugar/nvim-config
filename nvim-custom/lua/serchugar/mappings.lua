-- Open and close floating window terminal 
local term = require("serchugar.utils.terminal")
vim.keymap.set("n", "<A-i>", function() term.OpenFloat() end)
vim.keymap.set("t", "<A-i>", function() term.Hide() end)

-- Turn off hlsearch
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open file explorer
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

-- Leader Tab to delete the current buffer. Tab and Shift-Tab go to next and previous buffer. :bl and :bf to last and first buffer
vim.keymap.set("n", "<leader><tab>", ":bd<CR>")
vim.keymap.set("n", "<tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- Move selected blocks with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J keep the cursor at the start of the line appending the lines from below
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the same place when halfpage jump with <C-d/u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Allows to keep the cursor in the middle when doing search with "/"
vim.keymap.set("n", "n", "nzzzv") -- go to next
vim.keymap.set("n", "<C-n>", "Nzzzv") -- go to prev

-- This one is to indent everything automatically
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Allows to paste multiple times. Before one could only paste once and the copy buffer would be emptied
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Lets yank to system clipboard so one can paste things outside of nvim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register. So delete and not lose prior copy buffer
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Pressing Q does literally nothing. So it won't enter Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Location list navigation. Similar to quickfix but operates on buffer-local issues
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Execute this command to replace the word the cursor in currently on, in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
