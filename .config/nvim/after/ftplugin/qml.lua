local bufnr = vim.api.nvim_get_current_buf()
local tabstop = "tabstop"
local softtabstop = "softtabstop"
local shiftwidth = "shiftwidth"

vim.api.nvim_set_option_value(tabstop, 4, {buf = bufnr})
vim.api.nvim_set_option_value(softtabstop, 4, {buf = bufnr})
vim.api.nvim_set_option_value(shiftwidth, 4, {buf = bufnr})
