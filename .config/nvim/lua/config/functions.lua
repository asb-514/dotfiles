
function myformat_buffer()
	-- Save current cursor position
	local cursor_pos = vim.fn.getcurpos()

	-- Format the buffer
	vim.api.nvim_command('normal gg=G')

	-- Restore cursor position
	vim.fn.setpos('.', cursor_pos)
end

-- Define a Lua function to compile the code
function mycompile(filename)
	local path_to_file = vim.fn.expand('%:p')
	--    local compileCmd = "bash compile.sh " .. filename .. " 2"
	local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch /Users/shashank/Documents/contest/pch/bits/stdc++.h.pch "..filename..".cpp -o "..filename
	myformat_buffer()
	vim.cmd(':w')
	vim.cmd(':vsplit | term ' .. compileCmd)
	--    os.execute(compileCmd)
end

-- Define a Lua function to open the output file in a split buffer
function myrun_input(filename)
	local testcases_file = "inp" .. filename
	local runcmd = "./"..filename.." <" .. testcases_file
	--os.execute(runcmd)
	vim.cmd(':vsplit | term ' .. runcmd)
end

-- Define a Lua function to compile and run the code
function mycompileAndRun(filename)
	local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch /Users/shashank/Documents/contest/pch/bits/stdc++.h.pch "..filename..".cpp -o "..filename
	myformat_buffer()
	vim.cmd(':w')
	local testcases_file = "inp" .. filename
	local runcmd = "./"..filename.." <" .. testcases_file
	vim.cmd(':vsplit | term ' .. compileCmd.."&& ".. runcmd)
end


-- Lua function to open main.cpp files in tabs with CWD set to subdirectory and return to root
function OpenMainCppFilesSorted()
	-- Get the current working directory (root directory)
	local root_dir = vim.fn.getcwd()

	-- Open a new tab for the root directory
	--vim.cmd('tabedit ' .. root_dir)

	-- Find all main.cpp files in subdirectories and sort them
	local main_cpp_files = vim.fn.systemlist('find . -type f -name "main.cpp" | sort')
	if #main_cpp_files == 0 then
		print('No main.cpp files found.')
		return
	end

	-- Open each file as a new tab with CWD set to subdirectory
	for _, file in ipairs(main_cpp_files) do
		-- Open the file in a new tab with CWD set to the file's directory
		vim.cmd('edit ' .. root_dir.. '/' ..file)
		--local file_dir = vim.fn.expand('%:p:h')
		--vim.cmd('lcd ' .. file_dir)
		--vim.cmd('tabprevious')
	end
	--vim.cmd('tabclose')
	--print('All main.cpp files opened in NeoVim tabs with CWD set and sorted, returning to root.')
end
-- Define a function to update the status line for specific file types
function myupdate_statusline()
	if vim.bo.filetype == "CompetiTest" then
		vim.wo.statusline = " "
	end
end
