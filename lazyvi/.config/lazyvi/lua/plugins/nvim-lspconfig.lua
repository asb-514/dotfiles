return {
	"neovim/nvim-lspconfig",
	lazy = false,
	version = false,
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", function()
					require("fzf-lua").lsp_definitions({ jump_to_single_result = true, ignore_current_line = true })
				end, "[G]oto [D]efinition")
				map("gr", function()
					require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
				end, "[G]oto [R]eferences")
				map("gI", function()
					require("fzf-lua").lsp_implementations({
						jump_to_single_result = true,
						ignore_current_line = true,
					})
				end, "[G]oto [I]mplementation")
				map("gy", function()
					require("fzf-lua").lsp_typedefs({ jump_to_single_result = true, ignore_current_line = true })
				end, "Type [D]efinations")
				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					--vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					--	buffer = event.buf,
					--	group = highlight_augroup,
					--	callback = vim.lsp.buf.document_highlight,
					--})

					--vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					--	buffer = event.buf,
					--	group = highlight_augroup,
					--	callback = vim.lsp.buf.clear_references,
					--})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>ci", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})
		local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		vim.diagnostic.config({ signs = { text = diagnostic_signs } })
		vim.diagnostic.config({ virtual_text = true })
		local servers = {
			clangd = {
				autostart = false,
			},
			pyright = {
				autostart = false,
			},
			lua_ls = {
				autostart = false,
			},
		}

		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		for server, config in pairs(servers) do
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
}
