local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- layouts = {
  --   sidebar = {
  --     -- You can change the order of elements in the sidebar
  --     elements = {
  --       -- Provide as ID strings or tables with "id" and "size" keys
  --       {
  --         id = "scopes",
  --         size = 0.25, -- Can be float or integer > 1
  --       },
  --       { id = "breakpoints", size = 0.25 },
  --       -- { id = "stacks", size = 0.25 },
  --       -- { id = "watches", size = 00.25 },
  --     },
  --     size = 40,
  --     position = "right", -- Can be "left", "right", "top", "bottom"
  --   },
  --   tray = {
  --     elements = {},
  --     -- elements = { "repl" },
  --     -- size = 10,
  --     -- position = "bottom", -- Can be "left", "right", "top", "bottom"
  --   },
  -- },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}

local icons = require "user.icons"

vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- javascript

local dap = require "dap"
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}

-- nvim-telescope/telescope-dap.nvim
require("telescope").load_extension "dap"
require("telescope").load_extension "dap"
require("nvim-dap-virtual-text").setup()
-- require('dapui').setup()
