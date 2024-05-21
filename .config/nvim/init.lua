-- lazy plugin 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader to "<Space>"
vim.g.mapleader = " "
vim.g.localleader = ","

-- Key mappings
--vim.api.nvim_set_keymap('n', '<Leader>e', ':edit ', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>p', ':bp<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<tab>', ':bn<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<s-tab>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG$"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':terminal<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })



-- Adding fzf to runtime path
vim.opt.runtimepath:append("/opt/homebrew/opt/fzf")

-- Number of colors (termguicolors for true color support)
--vim.opt.termguicolors = true

-- Set background (optional)
-- vim.opt.background = "dark"

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
--vim.opt.shellslash = true -- Use forward slashes for file paths in commands
vim.opt.guifont = "*" -- Set the default GUI font
--vim.opt.guicursor = "n-v-c-sm:block,r-ci-ve:ver25-Cursor,i-cr-o:hor20" -- Clear GUI cursor settings
-- vim.cmd([[:set guicursor=n-v-c:block,i-ci-ve:hor20]])
vim.cmd([[autocmd BufEnter * :set guicursor=n-v-c:block,i-ci-ve:hor20]])


vim.opt.iskeyword:append(":") -- Include ':' as part of a word when navigating
vim.opt.foldmethod ="manual" -- syntax is also prossible
--vim.opt.syntax = "on" -- Enable syntax highlighting
vim.cmd([[set syntax=on]])

--https://github.com/neovim/neovim/pull/17266
vim.cmd([[
set laststatus=3
highlight WinSeperator guibg=None 
]])

--vim.opt.filetype = "plugin indent on" -- Enable filetype detection and plugins

-- Set block cursor in normal mode (GUI)
--vim.cmd([[
--let &t_SI = "\e[4 q"
--let &t_EI = "\e[2 q"
--]])
--
--if vim.fn.has('gui_running') == 1 then
--	vim.opt.guicursor:append('n-v-c:block-Cursor/lCursor') -- Normal mode
--	vim.opt.guicursor:append('i-ci:ver25-Cursor/lCursor') -- Insert mode
--end

-- Set horizontal line cursor in insert mode (Terminal)
--vim.cmd([[
--	autocmd InsertEnter * set guicursor=i-ci:ver25-Cursor/lCursor
--	autocmd InsertLeave * set guicursor=n-v-c:block-Cursor/lCursor
--]])
-- Define a function to format the buffer and return cursor to original position
function myformat_buffer()
	-- Save current cursor position
	local cursor_pos = vim.fn.getcurpos()

	-- Format the buffer
	vim.api.nvim_command('normal gg=G')

	-- Restore cursor position
	vim.fn.setpos('.', cursor_pos)
end

-- Define a Lua function to compile the code
function mycompile(filename)
	local path_to_file = vim.fn.expand('%:p')
	--    local compileCmd = "bash compile.sh " .. filename .. " 2"
	local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch /Users/shashank/Documents/contest/pch/bits/stdc++.h.pch "..filename..".cpp -o "..filename
	myformat_buffer()
	vim.cmd(':w')
	vim.cmd(':vsplit | term ' .. compileCmd)
	--    os.execute(compileCmd)
end

-- Define a Lua function to open the output file in a split buffer
function myrun_input(filename)
	local testcases_file = "inp" .. filename
	local runcmd = "./"..filename.." <" .. testcases_file
	--os.execute(runcmd)
	vim.cmd(':vsplit | term ' .. runcmd)
end

-- Define a Lua function to compile and run the code
function mycompileAndRun(filename)
	local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch /Users/shashank/Documents/contest/pch/bits/stdc++.h.pch "..filename..".cpp -o "..filename
	myformat_buffer()
	vim.cmd(':w')
	local testcases_file = "inp" .. filename
	local runcmd = "./"..filename.." <" .. testcases_file
	vim.cmd(':vsplit | term ' .. compileCmd.."&& ".. runcmd)
end


-- Lua function to open main.cpp files in tabs with CWD set to subdirectory and return to root
function OpenMainCppFilesSorted()
	-- Get the current working directory (root directory)
	local root_dir = vim.fn.getcwd()

	-- Open a new tab for the root directory
	--vim.cmd('tabedit ' .. root_dir)

	-- Find all main.cpp files in subdirectories and sort them
	local main_cpp_files = vim.fn.systemlist('find . -type f -name "main.cpp" | sort')
	if #main_cpp_files == 0 then
		print('No main.cpp files found.')
		return
	end

	-- Open each file as a new tab with CWD set to subdirectory
	for _, file in ipairs(main_cpp_files) do
		-- Open the file in a new tab with CWD set to the file's directory
		vim.cmd('edit ' .. root_dir.. '/' ..file)
		--local file_dir = vim.fn.expand('%:p:h')
		--vim.cmd('lcd ' .. file_dir)
		--vim.cmd('tabprevious')
	end
	--vim.cmd('tabclose')
	--print('All main.cpp files opened in NeoVim tabs with CWD set and sorted, returning to root.')
end

-- C/C++ customizations
vim.cmd([[
augroup CppCustomizations
autocmd!
autocmd FileType cpp,c noremap <F10> :lua mycompileAndRun("%<")<CR>
autocmd FileType cpp,c noremap <F9> :lua mycompile("%<")<CR>
autocmd FileType cpp,c noremap <F8> lua myrun_input("%<")<CR>
autocmd FileType cpp,c inoremap {<cr>   {}<left><cr><esc>ko
"autocmd FileType cpp,c noremap <s-tab> <esc> ]}o
"autocmd FileType cpp,c inoremap <s-tab> <esc> ]}o
autocmd Filetype cpp,c noremap <Leader>i : call system('pbpaste > inp' . expand('%<'))<cr>
autocmd FileType cpp,c noremap <Leader>I :vs inp%<<CR>
autocmd FileType cpp,c setlocal equalprg=clang-format\ -style=WebKit
"autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+20\ \-Wall
augroup END
]])

-- jk to escape in insert mode and visual mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', 'kj', '<Esc>', { noremap = true })


-- Python customizations
vim.cmd([[
augroup PythonCustomizations
autocmd!
autocmd FileType python noremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
autocmd FileType python inoremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
autocmd FileType python noremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
autocmd FileType python inoremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
"autocmd FileType python noremap <Leader>dd :w<cr>:vsplit | terminal python3 -m pdb "%"<cr>
"autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null
autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null\ -


"autocmd FileType python set formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -
augroup END
]])

vim.cmd [[
" Return to last edit position when opening files (You want this!)
" Only do this part when compiled with support for autocommands
if has("autocmd")
augroup redhat
autocmd!
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
augroup END
endif
]]
-- Define a function to update the status line for specific file types
function myupdate_statusline()
	if vim.bo.filetype == "CompetiTest" or
		vim.bo.filetype == "neo-tree" then
		vim.wo.statusline = " "
	end
end

-- Autocmd to call the function for specific file types
vim.cmd[[
	augroup UpdateStatusline
	autocmd!
	autocmd BufEnter,BufWinEnter * lua myupdate_statusline()
	augroup END
	]]


local plugins = {
	{
		'rktjmp/lush.nvim',
		lazy = true,
		priority = 1000,
	},
	{
		'metalelf0/jellybeans-nvim',
		lazy = true,
		priority = 1000,
		dependencies = {'rktjmp/lush.nvim',},
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			vim.cmd.colorscheme 'jellybeans-nvim'
		end,
	}, 
	{
		'ishan9299/nvim-solarized-lua',
		lazy = true,
		priority = 1000,
		config = function ()
			vim.g.solarized_italics = 1
			vim.opt.background = "light"
			vim.g.solarized_visibility = 'low'
			vim.cmd([[colorscheme solarized-low]])
			vim.opt.termguicolors = true
		end
	},

	{
		'xeluxee/competitest.nvim',
		lazy = true,
		ft = {"cpp"},
		keys = {{"<leader>r","<cmd>CompetiTest run<CR>",mode = "n"},{"<leader>c","<cmd>CompetiTest receive contest<CR>",mode = "n"},{"<leader>p","<cmd>CompetiTest receive problem<CR>",mode = "n"}},
		dependencies = 'MunifTanjim/nui.nvim',
		config = function() 
			require('competitest').setup {
				local_config_file_name = ".competitest.lua",

				floating_border = "rounded",
				floating_border_highlight = "FloatBorder",
				picker_ui = {
					-- edit_testcases
					width = 0.5,
					height = 0.5,
					mappings = {
						focus_next = { "j", "<down>", "<Tab>" },
						focus_prev = { "k", "<up>", "<S-Tab>" },
						close = { "<esc>", "<C-c>", "q", "Q" },
						submit = { "<cr>" },
					},
				},
				editor_ui = {
					-- edit_testcases after picking
					popup_width = 0.4,
					popup_height = 0.6,
					show_nu = true,
					show_rnu = false,
					normal_mode_mappings = {
						switch_window = { "<C-h>", "<C-l>", "<C-i>" },
						save_and_close = "<C-s>",
						cancel = { "q", "Q" },
					},
					insert_mode_mappings = {
						switch_window = { "<C-h>", "<C-l>", "<C-i>" },
						save_and_close = "<C-s>",
						cancel = "<C-q>",
					},
				},
				runner_ui = {
					interface = "split",
					selector_show_nu = false,
					selector_show_rnu = false,
					show_nu = false,
					show_rnu = false,
					mappings = {
						run_again = "R",
						run_all_again = "<C-r>",
						kill = "K",
						kill_all = "<C-k>",
						view_input = { "i", "I" },
						view_output = { "a", "A" },
						view_stdout = { "o", "O" },
						view_stderr = { "e", "E" },
						toggle_diff = { "d", "D" },
						close = { "q", "Q" },
					},
					viewer = {
						width = 0.7,
						height = 1,
						show_nu = true,
						show_rnu = false,
						close_mappings = { "q", "Q" },
					},
				},
				popup_ui = {
					total_width = 0.8,
					total_height = 0.8,
					layout = {
						{ 4, "tc" },
						{ 5, { { 1, "so" }, { 1, "si" } } },
						{ 5, { { 1, "eo" }, { 1, "se" } } },
					},
				},
				split_ui = {
					position = "right",
					relative_to_editor = true,
					total_width = 0.6,
					vertical_layout = {
						{ 1, "se" },
						{ 1, { { 1, "tc" }, { 1, "si" } } },
						{ 1, { { 1, "so" }, { 1, "eo" } } },
					},
					total_height = 0.4,
					horizontal_layout = {
						{ 2, "se" },
						{ 3, { { 1, "so" }, { 1, "si" } } },
						{ 3, { { 1, "eo" }, { 1, "tc" } } },
					},
				},

				save_current_file = true,
				save_all_files = false,
				compile_directory = ".",
				compile_command = {
					c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
					cpp = { exec = "g++", args = { "-DONPC", "-g" ,"-std=c++20", "-O2", "-Wkeyword-macro", "-Wmacro-redefined", "-Wall", "-Wextra", "-pedantic", "-Wshadow", "-Wformat=2", "-Wfloat-equal", "-Wconversion", "-Wshift-overflow", "-Wshorten-64-to-32", "-Wcast-qual", "-Wcast-align", "-Wno-unused-result", "-Wno-sign-conversion", "-fsanitize=address", "-fsanitize=undefined", "-fsanitize=float-divide-by-zero", "-fsanitize=float-cast-overflow", "-fno-sanitize-recover=all", "-fstack-protector-all", "-D_FORTIFY_SOURCE=2", "-D_GLIBCXX_DEBUG", "-D_GLIBCXX_DEBUG_PEDANTIC", "-isystem", "pch", "-include-pch", "/Users/shashank/Documents/contest/pch/bits/stdc++.h.pch", "$(FNAME)", "-o", "$(FNOEXT)" } },
					--cpp = { exec = "make", args = {}},
					rust = { exec = "rustc", args = { "$(FNAME)" } },
					java = { exec = "javac", args = { "$(FNAME)" } },
				},
				running_directory = ".",
				run_command = {
					c = { exec = "./$(FNOEXT)" },
					cpp = { exec = "./$(FNOEXT)" },
					rust = { exec = "./$(FNOEXT)" },
					python = { exec = "python", args = { "$(FNAME)" } },
					java = { exec = "java", args = { "$(FNOEXT)" } },
				},
				multiple_testing = -1,
				maximum_time = 5000,
				output_compare_method = "squish",
				view_output_diff = false,

				--testcases_directory = ".",
				--testcases_use_single_file = false,
				--testcases_auto_detect_storage = true,
				--testcases_single_file_format = "$(FNOEXT).testcases",
				--testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
				--testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
				testcases_use_single_file = false,
				--testcases_auto_detect_storage = true,
				--testcases_single_file_format = "$(FNOEXT).testcases",

				-- best so far 
				testcases_directory = "test",
				testcases_input_file_format = "sample-$(TCNUM).in",
				testcases_output_file_format = "sample-$(TCNUM).out",
				-- if using cf tools, enable the below config;
				-- testcases_directory = ".",
				-- testcases_input_file_format = "in$(TCNUM).txt",
				-- testcases_output_file_format = "ans$(TCNUM).txt",

				companion_port = 27121,
				receive_print_message = true,
				--template_file = false,
				template_file = "~/Documents/contest/snippets/template.$(FEXT)",
				evaluate_template_modifiers = true,
				date_format = "%c",
				received_files_extension = "cpp",
				received_problems_path = "$(JAVA_TASK_CLASS)/main.$(FEXT)",
				received_problems_prompt_path = false,
				received_contests_directory = "$(CWD)",
				--received_contests_problems_path = "$(PROBLEM).$(FEXT)",
				received_contests_problems_path = "$(JAVA_TASK_CLASS)/main.$(FEXT)",
				received_contests_prompt_directory = false,
				received_contests_prompt_extension = false,
				open_received_problems = true,
				open_received_contests = true,
				replace_received_testcases = false,
				-- Mapping for running CompetiTest
				vim.api.nvim_set_keymap('n', '<leader>r', "<cmd>CompetiTest run<CR>", { noremap = true, silent = true }),
				vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>CompetiTest receive contest<CR>", { noremap = true, silent = true }),
				vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>CompetiTest receive problem<CR>", { noremap = true, silent = true }),

				-- Mapping for adding CompetiTest testcase
				--vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>:CompetiTest add_testcase<CR>", { noremap = true, silent = false }),
			}
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = true,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},


	},
	{
		'honza/vim-snippets',
		lazy = true,
		event = "InsertEnter",
		dependencies = { 'SirVer/ultisnips' }, -- 'dependencies' changed to 'requires'
	},
	{
		'SirVer/ultisnips',
		event = "InsertEnter",
		lazy = true,
		--event = "InsertEnter", will be loaded when loading the nvim-cmp
		config = function()
			-- Set UltiSnips expand trigger to Enter key
			vim.g.UltiSnipsExpandTrigger = '<cr>'
			-- Set UltiSnips forward jump trigger to Tab key
			vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
			-- Set UltiSnips backward jump trigger to Shift+Tab keys
			vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
			-- Set UltiSnipsEdit to split the window vertically
			vim.g.UltiSnipsEditSplit = "vertical" -- Commented out for now
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			--"nvim-tree/nvim-web-devicons",
			--"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local transform_mod = require("telescope.actions.mt").transform_mod

			telescope.load_extension("fzf")

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		lazy = true,
		--event = { "BufReadPre", "BufNewFile" },
		event = "VeryLazy",
		--event = { "InsertEnter"},
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'SirVer/ultisnips',
			'quangnguyen30192/cmp-nvim-ultisnips',
		},

		config = function ()

			-- Set up nvim-cmp.
			local cmp = require'cmp'

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'ultisnips' }, -- For ultisnips users.
					{ name = 'nvim_lsp', max_item_count = 4},
					-- { name = 'vsnip' }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'snippy' }, -- For snippy users.
					}, {
					{ name = 'buffer' },
						{ name = 'path' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
				{ name = 'buffer' }
				}
			})
			-- LSP

			local nvim_lsp = require('lspconfig')

			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = {
						spacing = 8,
						severity_limit = "Error",
					},
					signs = false,
					update_in_insert = false,
				}
			)

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local lsp_on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				--Enable completion triggered by <c-x><c-o>
				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				local opts = { noremap=true, silent=true }

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

				-- Workspace management
				buf_set_keymap('n', '<Leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<Leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<Leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

				buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				buf_set_keymap('n', '<Leader>le', '<cmd>lua vim.diagnostic.open_float({scope="c"})<CR>', opts)
				buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
				buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
				buf_set_keymap('n', '<Leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

				if client.server_capabilities.documentFormattingProvider then
					buf_set_keymap('n', '<Leader>lw', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
				else
					buf_set_keymap('n', '<Leader>lw', '<cmd>echom "LSP formatting not supported"<CR>', opts)
				end
				if client.server_capabilities.documentRangeFormattingProvider then
					buf_set_keymap('v', '<Leader>lw', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
				else
					buf_set_keymap('v', '<Leader>lw', '<cmd>echom "LSP range formatting not supported"<CR>', opts)
				end

				if client.server_capabilities.documentHighlightProvider then
					vim.cmd [[
						augroup lsp_document_highlight
						autocmd! * <buffer>
						autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
						autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
						]]
				end
			end

			vim.cmd [[highlight LspReferenceText cterm=bold guibg=LightYellow]]
			vim.cmd [[highlight LspReferenceRead cterm=bold ctermbg=0 guibg=LightYellow]]
			vim.cmd [[highlight LspReferenceWrite cterm=bold ctermbg=0 guibg=LightYellow]]


			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			capabilities.offsetEncoding = "utf-8"

			local servers = { "clangd", "pyright","texlab"}
			for _, lsp in ipairs(servers) do
				local capabilities = require('cmp_nvim_lsp').default_capabilities()
				capabilities.offsetEncoding = "utf-8"
				nvim_lsp[lsp].setup {
					on_attach = lsp_on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					capabilities = capabilities,
				}
			end
		end
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",

		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		config = function ()

			require('leetcode').setup {
			}
		end
	},
	{
		"akinsho/bufferline.nvim",
		event = "BufAdd",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		},
		opts = {
			options = {
				-- stylua: ignore
				close_command = function(n) require("mini.bufremove").delete(n, false) end,
				-- stylua: ignore
				right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
			function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
			{
				"<leader>ge",
			function()
					require("neo-tree.command").execute({ source = "git_status", toggle = true })
				end,
				desc = "Git Explorer",
			},
			{
				"<leader>be",
			function()
					require("neo-tree.command").execute({ source = "buffers", toggle = true })
				end,
				desc = "Buffer Explorer",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.uv.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
					["Y"] = {
						function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							vim.fn.setreg("+", path, "c")
						end,
						desc = "Copy Path to Clipboard",
					},
					["O"] = {
						function(state)
							require("lazy.util").open(state.tree:get_node().path, { system = true })
						end,
						desc = "Open with System Application",
					},
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
		config = function(_, opts)
			local function on_move(data)
				LazyVim.lsp.on_rename(data.source, data.destination)
			end

			local events = require("neo-tree.events")
			opts.event_handlers = opts.event_handlers or {}
			vim.list_extend(opts.event_handlers, {
				{ event = events.FILE_MOVED, handler = on_move },
				{ event = events.FILE_RENAMED, handler = on_move },
			})
			require("neo-tree").setup(opts)
			vim.api.nvim_create_autocmd("TermClose", {
				pattern = "*lazygit",
				callback = function()
					if package.loaded["neo-tree.sources.git_status"] then
						require("neo-tree.sources.git_status").refresh()
					end
				end,
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		lazy = true,
		keys = {
			{
				"<leader>bd",
			function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
					if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			-- stylua: ignore
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		--ft = {"python","tex","cpp"},
		config = function ()
			vim.opt.termguicolors = true
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					neotree = false,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
				vim.cmd.colorscheme "catppuccin-mocha",
			})
		end
	},
	---- lazy.nvim
	{
		"lervag/vimtex",
		init = function()
			-- Use init for configuration, don't use the more common "config".
			vim.cmd([[
			syntax enable
			let g:vimtex_view_method = 'skim'

			" Or with a generic interface:
			let g:vimtex_view_general_viewer = 'okular'
			let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
			" VimTeX uses latexmk as the default compiler backend. If you use it, which is
			" strongly recommended, you probably don't need to configure anything. If you
			" want another compiler backend, you can change it as follows. The list of
			" supported backends and further explanation is provided in the documentation,
			" see ":help vimtex-compiler".

			let g:vimtex_compiler_method = 'latexmk' 
			" Most VimTeX mappings rely on localleader and this can be changed with the
			" following line. The default is usually fine and is the symbol "\".
			let maplocalleader = ","
			]])
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- provides the indentation lines
		-- plugin not working for solarized theme
		lazy = true,
		ft = {"python","cpp","lua"},
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = true,
		event = "VeryLazy",


		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup {
				ensure_installed = {"python","cpp"},
				highlight = {
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					disable = { "lua","rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true }
			}
		end
	}
}
local opts = {}
require("lazy").setup(plugins,opts)

--require("leetcode")



--vim.cmd([[
--"tabline                                                                                                                                                                                                                                                                
--if exists("+showtabline")
--function MyTabLine()
--let s = ''
--let t = tabpagenr()
--let i = 1
--while i <= tabpagenr('$')
--let buflist = tabpagebuflist(i)
--let winnr = tabpagewinnr(i)
--let s .= '%' . i . 'T'
--let s .= (i == t ? '%1*' : '%2*')
--let s .= ' '
--let s .= '|'. i . ')'
--let s .= ' %*'
--let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
--let file = bufname(buflist[winnr - 1])
--let file = fnamemodify(file, ':p:t')
--if file == ''
--let file = '[No Name]'
--endif
--let s .= file
--let s .= ' ' 
--let i = i + 1
--endwhile
--let s .= '%T%#TabLineFill#%='
--let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
--return s
--endfunction
--set stal=2
--set tabline=%!MyTabLine()
--endif
--]])


vim.cmd([[
	" same as autocmd BufEnter * silent! :lcd%:p:h
	set autochdir
	" .zshrc on path 
	set shell=/bin/zsh

	autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
	]])
-- refocus after inverse search in vimtex skim 
vim.cmd([[
	function! s:TexFocusVim() abort
	" Replace `TERMINAL` with the name of your terminal application
	" Example: execute "!open -a iTerm"  
	" Example: execute "!open -a Alacritty"
	"silent execute "!open -a TERMINAL"
	"silent execute "!open -a iTerm"
	silent execute "!open -a WezTerm"
	redraw!
	endfunction
	augroup vimtex_event_focus
	au!
	au User VimtexEventViewReverse call s:TexFocusVim()
	augroup END

]])
