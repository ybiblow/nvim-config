return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                command = "/home/jack/.local/share/nvim/mason/bin/codelldb",
                args = { "--port", "${port}" },

                -- On windows you may have to uncomment this:
                -- detached = false,
            },
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.cpp

        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})
    end,
}
