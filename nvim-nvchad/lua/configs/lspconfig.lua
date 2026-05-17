require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "jdtls", "pylsp", "html", "cssls", "rust_analyzer" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
end)
