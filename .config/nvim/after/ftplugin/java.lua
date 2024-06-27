-- Setup our JDTLS server any time we open up a java file
vim.cmd [[
	lua require'config.jdtls'.setup_jdtls()
	noremap <Leader>F :!java-format -i %<cr>
	vnoremap <Leader>F :!java-format<CR>
	set equalprg=clang-format
]]
