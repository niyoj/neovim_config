-- Debugging Adapter Protocol (DAP) support for Python debugging
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")
      local dapui = require("dapui")

      -- Setup Python debugger
      -- Make sure debugpy is installed: pip install debugpy
      dap_python.setup("python")

      -- Setup DAP UI
      dapui.setup()

      -- Key mappings for debugging
      vim.keymap.set("n", "<F5>", dap.continue, { noremap = true })
      vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true })
      vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true })
      vim.keymap.set("n", "<F12>", dap.step_out, { noremap = true })
      vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { noremap = true })
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { noremap = true })
      vim.keymap.set("n", "<Leader>bl", dap.run_last, { noremap = true })
      vim.keymap.set("n", "<Leader>dr", dapui.toggle, { noremap = true })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { 
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
