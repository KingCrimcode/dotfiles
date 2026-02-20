-- AI completions
return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup({
			provider_options = {
				codestral = {
					optional = {
						max_tokens = 256,
						stop = { "\n\n" },
					},
				},
			},
		})
	end,
}
