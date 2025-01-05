vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Normal mode mappings
vim.api.nvim_set_keymap("n", "<LocalLeader>e", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>wq", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "mtgg=G:w<CR>0VG$\"*y't", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>r", ":make!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<LocalLeader>l",
	":-1read ~/Documents/contest/library/templates/",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<LocalLeader>s",
	":-1read ~/.config/nvim-vim/snippets",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "L", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<esc>ko", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
