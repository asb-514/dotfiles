return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		-- get access to the none-ls functions
		local null_ls = require("null-ls")
		-- run the setup function for none-ls to setup our different formatters
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.ast_
				-- setup eslint linter for javascript
				-- require("none-ls.diagnostics.eslint_d"),
				--null_ls.builtins.formatting.google_java_format,
				---- setup lua formatter
				--null_ls.builtins.formatting.clang_format,
				--null_ls.builtins.formatting.stylua,
				--null_ls.builtins.formatting.black,
				--null_ls.builtins.formatting.prettierd.with({
				--	extra_args = function(params)
				--		return params.options
				--			and params.options.tabSize
				--			and {
				--				"--tab-width",
				--				params.options.tabSize
				--			}
				--	end
				--})
			}
		})

		-- set up a vim motion for <Space> + c + f to automatically format our code based on which langauge server is active
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
		vim.keymap.set("v", "<leader>fs", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end
}
