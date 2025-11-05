return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Start/Continue" },
    { "<leader>dn", function() require("dap").step_over() end, desc = "Step Over (Next)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "Quit Debug" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    -- venv python 찾기
    local function get_python()
      if vim.fn.filereadable(".venv/bin/python") == 1 then
        return vim.fn.getcwd() .. "/.venv/bin/python"
      end
      return "python3"
    end
    
    require("dap-python").setup(get_python())
    dapui.setup()
    
    -- UI 자동 토글
    dap.listeners.after.event_initialized["dapui"] = dapui.open
    dap.listeners.before.event_terminated["dapui"] = dapui.close
    dap.listeners.before.event_exited["dapui"] = dapui.close
    
    -- 브레이크포인트 표시 (빨간색)
    vim.fn.sign_define("DapBreakpoint", {
      text = "●",
      texthl = "DiagnosticError",
      linehl = "",
      numhl = "DiagnosticError"
    })
    vim.fn.sign_define("DapStopped", {
      text = "▶",
      texthl = "DiagnosticWarn",
      linehl = "Visual",
      numhl = "DiagnosticWarn"
    })
  end,
}
