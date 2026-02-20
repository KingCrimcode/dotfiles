-- Status bar
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- event = "ColorScheme",
		opts = function()
			return {
				options = {
					icons_enabled = true,
					theme = "base16",
					globalstatus = vim.o.laststatus == 3,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						-- "NvimTree",
						-- "dapui_scopes",
						-- "dapui_watches",
						-- "toggleterm",
					},
					ignore_focus = {},
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { { "filename", file_status = false, path = 4 } },
					lualine_b = {
						{ "filetype" },
						{
							"diagnostics",
							source = { "nvim_lsp" },
							sections = { "error", "warn", "info", "hint" },
							update_in_insert = true,
							always_visible = false,
						},
					},
					lualine_c = {
						"branch",
						"diff",
					},
					lualine_x = {
            -- Snacks.profiler.status(),
            -- stylua: ignore
            --[[ {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            }, ]]
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
						{
							require("minuet.lualine"),
						},
					},
					lualine_y = { "encoding", "fileformat" },
					lualine_z = { "progress", "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", file_status = false } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "lazy", "mason", "nvim-dap-ui", "neo-tree", "toggleterm" },
			}
		end,
	},
}
