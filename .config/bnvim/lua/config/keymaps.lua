-- Set mapleader to "<Space>"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Key mappings
vim.api.nvim_set_keymap("n", "<LocalLeader>wq", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", ":!cat % | pbcopy<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>o", ":lua OpenMainCppFilesSorted()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>O", ":lua OpenMainPyFilesSorted()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":bp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", ":bn<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", ":bd<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>e", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<LocalLeader>s",
	"/solve<CR>:noh<CR>wwa<CR><esc>wwwa<CR><esc>kko",
	{ noremap = true, silent = true }
)
--vim.api.nvim_set_keymap("i", "<C-j>", "<Esc> ]}o", { noremap = true })

-- jk to escape in insert mode and visual mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })
