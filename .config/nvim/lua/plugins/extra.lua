return {
	{
		"xeluxee/competitest.nvim",
		lazy = true, -- Some lame lazy error is occuring if used  with lazy = true, and both ft and keys.
		keys = {
			{ "<localleader>r", "<cmd>CompetiTest run<CR>", mode = "n" },
		},
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
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

				save_all_files = false,
				compile_directory = ".",
				compile_command = {
					c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
					cpp = { exec = "make", args = { "-f", "/Users/shashank/Documents/contest/Makefile" } },
				},
				running_directory = ".",
				run_command = {
					c = { exec = "./$(FNOEXT)" },
					cpp = { exec = "./$(FNOEXT)" },
					python = { exec = "python3", args = { "$(FNAME)" } },
				},
				-- best so far
				testcases_directory = "test",
				testcases_input_file_format = "sample-$(TCNUM).in",
				testcases_output_file_format = "sample-$(TCNUM).out",

				template_file = "$(HOME)/Documents/contest/snippets/template.$(FEXT)",
				evaluate_template_modifiers = false,
				received_files_extension = "cpp",

				received_problems_path = "$(HOME)/Documents/contest/practice/$(JAVA_TASK_CLASS)/main.$(FEXT)",
				received_problems_prompt_path = false,
				received_contests_directory = "$(HOME)/Documents/contest/$(JUDGE)/$(CONTEST)",
				received_contests_problems_path = "$(JAVA_TASK_CLASS)/main.$(FEXT)",
				received_contests_prompt_directory = false,
				received_contests_prompt_extension = false,
				replace_received_testcases = false,
			})
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- Use init for configuration, don't use the more common "config".
			vim.cmd([[
		syntax enable
		let g:vimtex_view_method = 'sioyek'

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
		" let maplocalleader = ","
		]])
		end,
	},
}
