-- Set mapleader to "<Space>"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

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

-- Neovide config
vim.opt.guifont = "JetBrainsMono Nerd Font:h14" -- Set the default GUI font
vim.g.neovide_window_blurred = true
vim.g.neovide_transparency = 0.8
vim.g.neovide_refresh_rate = 90
vim.g.neovide_show_border = false
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_remember_window_size = true
vim.g.floaterm_winblend = 15
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_trail_length = 0
--vim.g.neovide_cursor_vfx_mode = "railgun" -- Railgun particles behind cursor
--vim.g.neovide_cursor_vfx_opacity = 200.0
--vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
--vim.g.neovide_cursor_vfx_particle_density = 7.0
--vim.g.neovide_cursor_vfx_particle_speed = 10.0
--vim.g.neovide_cursor_vfx_particle_phase = 1.5
--vim.g.neovide_cursor_vfx_particle_curl = 1.0
--vim.g.neovide_cursor_unfocused_outline_width = 0.125

vim.cmd([[autocmd BufEnter * :set guicursor=n-v-c:block,i-ci-ve:hor20]])

vim.opt.iskeyword:append(":") -- Include ':' as part of a word when navigating
vim.cmd([[set syntax=on]])

--https://github.com/neovim/neovim/pull/17266
vim.cmd([[
set laststatus=3
highlight WinSeperator guibg=None 
]])

--Lazyvim Settings.
vim.g.snacks_animate = false
vim.g.lazyvim_blink_main = false
-- vim folds, check the tree sitter plugin
