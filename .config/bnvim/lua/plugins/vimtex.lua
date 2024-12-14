return {
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
		let maplocalleader = ","
		]])
	end,
}
