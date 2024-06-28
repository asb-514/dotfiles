-- Set mapleader to "<Space>"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>e', ':Explore<cr>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG$"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', ':bp<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':bn<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', ':bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', ':tabnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', ':tabprevious<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':terminal<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })

-- jk to escape in insert mode and visual mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })


