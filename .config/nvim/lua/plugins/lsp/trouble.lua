-- LSP diagnostics, references, quickfixes
return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		opts = {
			win = {
				size = 0.3,
			},
			modes = {
				symbols = {
					win = {
						size = 0.2,
						position = "left",
					},
					preview = {
						type = "split",
						relative = "win",
						position = "bottom",
						size = 0.4,
					},
				},
			},
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.4,
			},
		},
		keys = {
			{ "<leader>td", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostics (Current file)" },
			{ "<leader>tD", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (All buffers)" },
			{ "<leader>ts", "<Cmd>Trouble symbols toggle<CR>", desc = "Symbols" },
			{ "<leader>tS", "<Cmd>Trouble lsp toggle<CR>", desc = "Lsp Symbols" },
			{ "<leader>tl", "<Cmd>Trouble loclist toggle<CR>", desc = "Location list" },
			{ "<leader>tq", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
		},
		init = function()
			require("which-key").add({ "<leader>t", group = "Trouble" })
		end,
	},
}
