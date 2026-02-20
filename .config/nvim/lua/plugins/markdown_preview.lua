return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		-- build = function() vim.fn["mkdp#util#install"]() end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = false
			vim.api.nvim_exec2(
				[[
        function! OpenMarkdownPreview(url)
          execute "silent ! zen-browser --new-window " . a:url
        endfunction
        ]],
				{}
			)
			vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
		end,
		ft = { "markdown" },
		keys = {
			{ "<F12>", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview" } },
		},
	},
}
