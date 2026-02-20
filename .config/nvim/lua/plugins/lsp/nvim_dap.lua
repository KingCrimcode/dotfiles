return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Handlers to open/close the ui when debugging
			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.disconnect.dapui_config = function()
				dapui.close()
			end

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DiagnosticError", linehl = "", numhl = "DiagnosticError" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DiagnosticError", linehl = "", numhl = "DiagnosticError" }
			)
			vim.fn.sign_define(
			  "DapStopped",
			  { text = "", texthl = "DiagnosticHint", linehl = "", numhl = "DiagnosticHint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DiagnosticError", linehl = "", numhl = "DiagnosticError" }
			)
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "DiagnosticHint", linehl = "", numhl = "DiagnosticHint" }
			)

			dap.adapters = {
				codelldb = {
					type = "executable",
					command = "codelldb",
				},
			}

			dap.configurations = {
				cpp = {
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
				},
			}
      dap.configurations.c = dap.configurations.cpp
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "nvim-neotest/nvim-nio" },
		},
		event = "VeryLazy",
		opts = {
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.4,
						},
						{
							id = "breakpoints",
							size = 0.2,
						},
						{
							id = "stacks",
							size = 0.2,
						},
						{
							id = "watches",
							size = 0.2,
						},
					},
					position = "left",
					size = 35,
				},
				{
					elements = {
						{
							id = "console",
							size = 1,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
		},
		keys = {
			{
				-- "K",
        "<F56>",
				function()
					require("dapui").eval()
				end,
				desc = "debug: Evaluate expression under cursor",
			},
			{ "<F5>", "<Cmd>DapContinue<CR>", desc = "debug: Run/Continue" },
			{
				"<F6>",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "debug: Run to Cursor",
			},
			{ "<F7>", "<Cmd>DapStepInto<CR>", desc = "debug: Step Into" },
			{ "<F8>", "<Cmd>DapStepOver<CR>", desc = "debug: Step Over" },
			{ "<F20>", "<Cmd>DapStepOut<CR>", desc = "debug: Step Out" },
			{ "<F9>", "<Cmd>DapToggleBreakpoint<CR>", desc = "debug: Toggle Breakpoint" },
			{
				"<F21>",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition:"))
				end,
				desc = "debug: Set breakpoint with condition",
			},
			{ "<F10>", "<Cmd>DapToggleRepl<CR>", desc = "debug: Open REPL" },
		},
	},
}
