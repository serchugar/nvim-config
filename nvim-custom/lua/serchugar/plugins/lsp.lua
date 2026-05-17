return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "<leader>f", function() require("serchugar.utils.functions").custom_lsp_format(client) end, opts)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

            -- This is so that lsp does not override my highlight groups colors
            client.server_capabilities.semanticTokensProvider = nil
        end

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "jdtls",
                "csharp_ls",
            }
        })

        local capabilities = vim.tbl_deep_extend(
        "force", {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
        )

        require("mason-lspconfig").setup_handlers {
            -- Default config for lsp servers
            function(server_name)
                require("lspconfig")[server_name].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end,

            -- Custom config for lua lsp server
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            telemetry = { enable = false },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = {
                                    vim.env.VIMRUNTIME,
                                    vim.api.nvim_get_runtime_file("", true),
                                },
                                checkThirdParty = false,
                            },
                        }
                    }
                }
            end
        }

        vim.diagnostic.config({
            -- update_in_insert = true, -- update diagnostic in insert mode, while typing
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true, -- "always" behaves the same as true, as is considered truthy value
                header = "",
                prefix = "",
            },
        })
    end
}

