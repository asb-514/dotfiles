return {
	'JohanChane/wsnavigator.nvim',
	lazy = true,
	keys = {{"tt","<cmd>lua function() require('wsnavigator').create_win() end<CR>",mode = "n"}},
	config = function()
		require('wsnavigator').setup {
			ui = {
				float = {
					border    = 'single',         -- see ':h nvim_open_win'
					float_hl  = 'Normal',         -- see ':h winhl'
					border_hl = 'Normal',
					blend     = 0,                -- see ':h winblend'
					height    = 0.9,              -- Num from 0 - 1 for measurements
					width     = 0.9,
					x         = 0.5,              -- X and Y Axis of Window
					y         = 0.4
				},
			},
			max_len_of_entries = 20,    -- max length of entries
		}

		vim.keymap.set('n', 'tt', function()
			require('wsnavigator').create_win()
		end, { noremap = true })
	end,
}
