local utils = require("serchugar.utils.functions")
return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")
            dap.set_log_level("TRACE")

            vim.keymap.set("n", "<F5>", function() dap.continue() end)
            vim.keymap.set("n", "<F10>", function() dap.step_over() end)
            vim.keymap.set("n", "<F11>", function() dap.step_into() end)
            vim.keymap.set("n", "<F12>", function() dap.step_out() end)
            vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
            vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
            vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end)
            vim.keymap.set("n", "<leader>dl", function() dap.run_last() end)
        end
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            require("nvim-dap-virtual-text").setup()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            "scopes",
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 80,
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })
            vim.keymap.set("n", "<leader>dd", function() dapui.toggle() end)
            dap.listeners.after.event_initialized.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            dap.listeners.after.event_output.dapui_config = function(_, body)
                if body.category == "console" then
                    dapui.eval(body.output) -- Sends stdout/stderr to Console
                end
            end
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "neovim/nvim-lspconfig",
        },
        event = "VeryLazy",
        config = function()
            local dap_args = {}
            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "cpptools", -- codelldb does not stop on breakpoints for some reason
                },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                    cppdbg = function(config)
                        config.configurations = {
                            {
                                name = "Executable",
                                type = "cppdbg",
                                request = "launch",
                                program = function()
                                    local path = nil
                                    if utils.isWindowsOs() then
                                        path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\a.exe",
                                        "file")
                                    else
                                        path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out",
                                        "file")
                                    end
                                    local parsed_path = vim.split(path, " ")
                                    local executable = parsed_path[1]
                                    dap_args = {}
                                    if #parsed_path > 1 then
                                        dap_args = vim.list_slice(parsed_path, 2)
                                    end
                                    return executable
                                end,
                                cwd = "${workspaceFolder}",
                                stopOnEntry = false,
                                args = function()
                                    -- 3 Ways to update the value of dap_args:

                                    -- Way 1 (weird one)
                                    --for _,arg in ipairs(dap_args) do
                                    --end
                                    --return dap_args

                                    -- Way 2
                                    return vim.deepcopy(dap_args)

                                    -- Way 3
                                    --local updated_args = dap_args
                                    --return updated_args
                                end,
                                outputMode = "remote",
                            },
                        }
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })
        end,
    },
}
