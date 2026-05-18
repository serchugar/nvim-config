-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unmap LazyVim terminal mappings
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")

-- Custom terminal mappings
vim.keymap.set({ "n", "t" }, "<A-i>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set({ "n", "t" }, "<A-I>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
