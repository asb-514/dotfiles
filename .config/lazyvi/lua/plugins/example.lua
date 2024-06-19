-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
--jif true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
	-- add gruvbox
	--{ "ellisonleao/gruvbox.nvim" },

	-- Configure LazyVim to load gruvbox
	--{
	--  "LazyVim/LazyVim",
	--  opts = {
	--    colorscheme = "gruvbox",
	--  },
	--},

	-- change trouble config
	--{
	--  "folke/trouble.nvim",
	--  -- opts will be merged with the parent spec
	--  opts = { use_diagnostic_signs = true },
	--},

	-- disable trouble
	--{ "folke/trouble.nvim", enabled = false },

	{
		"xeluxee/competitest.nvim",
		keys = { { "<leader>r", "<cmd>CompetiTest run<CR>", mode = "n" } },
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
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
					cpp = {
						exec = "g++",
						args = {
							"-DONPC",
							"-g",
							"-std=c++20",
							"-O2",
							"-Wkeyword-macro",
							"-Wmacro-redefined",
							"-Wall",
							"-Wextra",
							"-pedantic",
							"-Wshadow",
							"-Wformat=2",
							"-Wfloat-equal",
							"-Wconversion",
							"-Wshift-overflow",
							"-Wshorten-64-to-32",
							"-Wcast-qual",
							"-Wcast-align",
							"-Wno-unused-result",
							"-Wno-sign-conversion",
							"-fsanitize=address",
							"-fsanitize=undefined",
							"-fsanitize=float-divide-by-zero",
							"-fsanitize=float-cast-overflow",
							"-fno-sanitize-recover=all",
							"-fstack-protector-all",
							"-D_FORTIFY_SOURCE=2",
							"-D_GLIBCXX_DEBUG",
							"-D_GLIBCXX_DEBUG_PEDANTIC",
							"-isystem",
							"pch",
							"-include-pch",
							"../pch/bits/stdc++.h.pch",
							"$(FNAME)",
							"-o",
							"$(FNOEXT)",
						},
					},
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
				testcases_directory = "test",
				testcases_use_single_file = false,
				--testcases_auto_detect_storage = true,
				--testcases_single_file_format = "$(FNOEXT).testcases",
				testcases_input_file_format = "sample-$(TCNUM).in",
				testcases_output_file_format = "sample-$(TCNUM).out",

				companion_port = 27121,
				receive_print_message = true,
				--template_file = false,
				template_file = "~/Documents/contest/snippets/template.$(FEXT)",
				evaluate_template_modifiers = false,
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
				open_received_contests = false,
				replace_received_testcases = false,
				-- Mapping for running CompetiTest
				vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>CompetiTest run<CR>", { noremap = true, silent = true }),

				-- Mapping for adding CompetiTest testcase
				--vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>:CompetiTest add_testcase<CR>", { noremap = true, silent = false }),
			})
		end,
		opts = {},
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

	-- the opts function can also be used to change the default opts:
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, "😄")
		end,
	},

	-- or you can return new options to override all the defaults
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				--[[add your custom lualine config here]]
			}
		end,
	},
}
