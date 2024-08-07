return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		keys = {
			{ "<leader>mi", "<cmd>Mason<cr>", desc = "Mason Install" },
		},
		config = function()
			-- setup mason with default properties
			require("mason").setup()
		end,
	},
	-- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			-- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
			require("mason-lspconfig").setup({
				ensure_installed = { "jdtls", "lua_ls", "clangd", "pyright", "texlab", "marksman", "bashls","typst_lsp" },
			})
		end,
	},
	--	mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		ft = {'java'},
		config = function()
			-- ensure the java debug adapter is installed
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
			})
		end,
	},
	-- utility plugin for configuring the java language server for us
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = {'java'},
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
