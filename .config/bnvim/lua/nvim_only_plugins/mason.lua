return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			-- setup mason with default properties
			require("mason").setup()
		end,
	},
	-- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			-- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"texlab",
					"marksman",
					"bashls",
					"typst_lsp",
				},
			})
		end,
	},
}
