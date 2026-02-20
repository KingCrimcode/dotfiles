-- Close explorer on quit automatically
--[[ vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local wins = vim.api.nvim_tabpage_list_wins(0)
		if #wins <= 1 then
			return
		end
		local sidebar_fts = { snacks_picker_list = true }
		for _, winid in pairs(wins) do
			if vim.api.nvim_win_is_valid(winid) then
				local bufnr = vim.api.nvim_win_get_buf(winid)
				local filetype = vim.bo[bufnr].filetype
				if not sidebar_fts[filetype] then
					return
				else
					sidebar_fts[filetype] = nil
				end
			end
		end
		if #vim.api.nvim_list_tabpages() > 1 then
			vim.cmd.tabclose()
		else
			vim.cmd.qall()
		end
	end,
}) ]]

vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		Source_colors()
		-- require("lazy").reload({ "lualine.nvim" })
	end,
})
