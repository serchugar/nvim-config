-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local term = require("utils.terminal")
vim.keymap.set("n", "<A-i>", function() term.OpenFloat() end)
vim.keymap.set("t", "<A-i>", function() term.Hide() end)
