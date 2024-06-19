return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
	config = function ()
		-- set to 1, Vim will refresh Markdown when saving the buffer or
		-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
		-- move the cursor
		-- default: 0
		vim.cmd([[let g:mkdp_refresh_slow = 0]])
	end
}
