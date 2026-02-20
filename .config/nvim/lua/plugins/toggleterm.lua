-- Terminal in editor
return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			highlights = {
				Normal = {
					link = "NormalFloat",
				},
				NormalFloat = {
					link = "NormalFloat",
				},
				FloatBorder = {
					link = "FloatBorder",
				},
			},
			shell = "zsh",
			size = 20,
		},
	},
}
