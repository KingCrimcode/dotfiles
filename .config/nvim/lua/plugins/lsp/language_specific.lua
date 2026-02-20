return {
	-- Flutter
	--[[ {
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		opts = {},
		config = true,
	}, ]]

	-- Rust
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
	},

	-- Rust: Dioxus
	--[[ {
		"mrxiaozhuox/dioxus.nvim",
		opts = {
			format = {
				split_line_attributes = true,
			},
		},
    ft = "rust",
	}, ]]
}
