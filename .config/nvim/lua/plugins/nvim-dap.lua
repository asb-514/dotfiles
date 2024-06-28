return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		ft = {"java"},
		dependencies = {
			-- ui plugins to make debugging simplier
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			-- gain access to the dap plugin and its functions
			local dap = require("dap")
			-- gain access to the dap ui plugin and its functions
			local dapui = require("dapui")

			-- Setup the dap ui with default configuration
			dapui.setup()

			-- setup an event listener for when the debugger is launched
			dap.listeners.before.launch.dapui_config = function()
				-- when the debugger is launched open up the debug ui
				dapui.open()
			end

			-- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

			-- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
			vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })

			-- set a vim motion to close the debugging ui
			vim.keymap.set("n", "<leader>dc", dapui.close, {desc = "[D]ebug [C]lose"})
		end
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		lazy = true,
		ft = {'java'},
	},
	{
		-- https://github.com/rcarriga/nvim-dap-ui
		'rcarriga/nvim-dap-ui',
		lazy = true,
		ft = {'java'},
		dependencies = {
			-- https://github.com/theHamsta/nvim-dap-virtual-text
			'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
			-- https://github.com/nvim-telescope/telescope-dap.nvim
			'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
		},
		opts = {
			controls = {
				element = "repl",
				enabled = false,
				icons = { disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = ""
				}
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" }
				}
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = ""
			},
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.50
						},
						{
							id = "stacks",
							size = 0.30
						},
						{
							id = "watches",
							size = 0.10
						},
						{
							id = "breakpoints",
							size = 0.10
						}
					},
					size = 40,
					position = "left", -- Can be "left" or "right"
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 10,
					position = "bottom", -- Can be "bottom" or "top"
				}
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t"
			},
			render = {
				indent = 1,
				max_value_lines = 100
			}
		},
		config = function (_, opts)
			local dap = require('dap')
			require('dapui').setup(opts)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				require('dapui').open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				-- Commented to prevent DAP UI from closing when unit tests finish
				-- require('dapui').close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				-- Commented to prevent DAP UI from closing when unit tests finish
				-- require('dapui').close()
			end

			-- Add dap configurations based on your language/adapter settings
			-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
			dap.configurations.java = {
				{
					name = "Debug Launch (2GB)";
					type = 'java';
					request = 'launch';
					vmArgs = "" ..
					"-Xmx2g "
				},
				{
					name = "Debug Attach (8000)";
					type = 'java';
					request = 'attach';
					hostName = "127.0.0.1";
					port = 8000;
				},
				{
					name = "Debug Attach (5005)";
					type = 'java';
					request = 'attach';
					hostName = "127.0.0.1";
					port = 5005;
				},
				{
					name = "My Custom Java Run Configuration",
					type = "java",
					request = "launch",
					-- You need to extend the classPath to list your dependencies.
					-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
					-- classPaths = {},

					-- If using multi-module projects, remove otherwise.
					-- projectName = "yourProjectName",

					-- javaExec = "java",
					mainClass = "replace.with.your.fully.qualified.MainClass",

					-- If using the JDK9+ module system, this needs to be extended
					-- `nvim-jdtls` would automatically populate this property
					-- modulePaths = {},
					vmArgs = "" ..
					"-Xmx2g "
				},
			}
		end
	},
	{
		-- Inline Debug Text
		-- https://github.com/theHamsta/nvim-dap-virtual-text
		'theHamsta/nvim-dap-virtual-text',
		lazy = true,
		ft = {'java'},
		opts = {
			-- Display debug text as a comment
			commented = true,
			-- Customize virtual text
			display_callback = function(variable, buf, stackframe, node, options)
				if options.virt_text_pos == 'inline' then
					return ' = ' .. variable.value
				else
					return variable.name .. ' = ' .. variable.value
				end
			end,
		}
	}
}
