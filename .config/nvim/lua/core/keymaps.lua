local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map({ "n", "t" }, "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Switch window left", silent = true })
map({ "n", "t" }, "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Switch window down", silent = true })
map({ "n", "t" }, "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Switch window up", silent = true })
map({ "n", "t" }, "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Switch window right", silent = true })

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Horizontal resize (+)", silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Horizontal resize (-)", silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Vertical resize (+)", silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Vertical resize (-)", silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines downwards", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines upwards", silent = true })

map("v", ">", ">gv", { desc = "Indent tab left", silent = true })
map("v", "<", "<gv", { desc = "Indent tab right", silent = true })

map({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and Clear hlsearch", silent = true })

map("n", "<C-q>", "<Cmd>ToggleTerm1 direction=horizontal name=horizontal<CR>", { desc = "Terminal horizontal" })
map("t", "<C-q>", "<Cmd>ToggleTerm1 direction=horizontal name=horizontal<CR>", { desc = "Terminal horizontal" })
map("n", "<C-t>", "<Cmd>ToggleTerm2 direction=float name=float<CR>", { desc = "Terminal float" })
map("t", "<C-t>", "<Cmd>ToggleTerm2 direction=float name=float<CR>", { desc = "Terminal float" })
