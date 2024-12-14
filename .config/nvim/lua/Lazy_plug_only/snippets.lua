return {
	"rafamadriz/friendly-snippets",
	config = function()
		require("luasnip.loaders.from_snipmate").load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
	end,
}
