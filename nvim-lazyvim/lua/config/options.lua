-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local utils = require("utils.functions")

vim.g.root_spec = { ".git", "cwd" }

if utils.isWindowsOs() then
  vim.o.shell = "powershell.exe"
end
