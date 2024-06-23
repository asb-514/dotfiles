-- Set encoding for LaTeX plugin
vim.opt.encoding = "utf-8"

vim.opt.autoindent = true -- Enable auto-indentation
vim.opt.autoread = true -- Automatically read files when changed outside of Neovim
vim.opt.cindent = true -- Enable C-style indenting
vim.opt.expandtab = false -- Use spaces instead of tabs for indentation
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.incsearch = true -- Show search matches as you type
vim.opt.mousehide = true -- Hide mouse cursor while typing
vim.opt.errorbells = false -- Disable error bells
vim.opt.swapfile = false -- Disable swap file creation
vim.opt.number = true -- Show line numbers
-- vim.opt.pastetoggle = "" -- Disable paste mode toggle
vim.opt.scrolloff = 15 -- Number of lines to keep above and below the cursor while scrolling
vim.opt.shiftwidth = 4 -- Number of spaces for each level of indentation
vim.opt.tabstop = 4 -- Number of spaces that <Tab> counts for
vim.opt.history = 1000 -- Number of command-line history entries to save
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.wrap = false -- Disable line wrapping
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = false -- Highlight current line
vim.opt.splitbelow = true -- Open new splits below the current one
vim.opt.splitright = true -- Open new splits to the right of the current one
vim.opt.guifont = "*" -- Set the default GUI font

vim.cmd([[autocmd BufEnter * :set guicursor=n-v-c:block,i-ci-ve:hor20]])

vim.opt.iskeyword:append(":") -- Include ':' as part of a word when navigating
vim.opt.foldmethod ="manual" -- syntax is also prossible
--vim.opt.syntax = "on" -- Enable syntax highlighting
vim.cmd([[set syntax=on]])
vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]

--https://github.com/neovim/neovim/pull/17266
vim.cmd([[
set laststatus=3
highlight WinSeperator guibg=None 
]])

