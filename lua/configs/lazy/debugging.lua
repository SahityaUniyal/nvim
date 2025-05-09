return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            require("dap-go").setup()
            require("dapui").setup()
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
            vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
            vim.keymap.set("n", "<Leader>dc", dap.continue, {})
        end,
    },
}
