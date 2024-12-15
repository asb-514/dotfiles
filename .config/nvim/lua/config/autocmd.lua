-- Define a function to update the status line
local function update_statusline()
	if vim.bo.filetype == "CompetiTest" then
		vim.wo.statusline = " " -- Set blank statusline
	else
		vim.wo.statusline = nil -- Restore default statusline
	end
end

-- Create an autocommand group
vim.api.nvim_create_augroup("UpdateStatusline", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "UpdateStatusline",
	callback = update_statusline, -- Use the Lua function directly
})
vim.api.nvim_exec_autocmds("FileType", {})
