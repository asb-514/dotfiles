-- Remove the `use` here if you're using folke/lazy.nvim.
return  {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function ()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set('i', '<C-l>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
		vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
		vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
	end
	--
	--let g:codeium_filetypes = {
    --\ "bash": v:false,
    --\ "typescript": v:true,
    --\ }
}
