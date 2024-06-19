-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[
if &term == 'xterm-kitty'
    let &t_ut=''
endif
]])
-- Define a Lua function to compile the code
function mycompile(filename)
  local path_to_file = vim.fn.expand("%:p")
  --    local compileCmd = "bash compile.sh " .. filename .. " 2"
  local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch ../pch/bits/stdc++.h.pch "
    .. filename
    .. ".cpp -o "
    .. filename
  vim.cmd(":w")
  vim.cmd(":vsplit | term " .. compileCmd)
  --    os.execute(compileCmd)
end

-- Define a Lua function to open the output file in a split buffer
function myrun_input(filename)
  local testcases_file = "inp" .. filename
  local runcmd = "./" .. filename .. " <" .. testcases_file
  --os.execute(runcmd)
  vim.cmd(":vsplit | term " .. runcmd)
end

-- Define a function to format the buffer and return cursor to original position
function myformat_buffer()
  -- Save current cursor position
  local cursor_pos = vim.fn.getcurpos()

  -- Format the buffer
  vim.api.nvim_command("normal gg=G")

  -- Restore cursor position
  vim.fn.setpos(".", cursor_pos)
end

-- Define a Lua function to compile and run the code
function mycompileAndRun(filename)
  local compileCmd = "g++ -DONPC -g -std=c++20 -O2 -Wkeyword-macro -Wmacro-redefined -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wshorten-64-to-32 -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -isystem pch -include-pch ../pch/bits/stdc++.h.pch "
    .. filename
    .. ".cpp -o "
    .. filename
  vim.cmd(":w")
  myformat_buffer()
  local testcases_file = "inp" .. filename
  local runcmd = "./" .. filename .. " <" .. testcases_file
  vim.cmd(":vsplit | term " .. compileCmd .. "&& " .. runcmd)
end

-- Lua function to open main.cpp files in tabs with CWD set to subdirectory and return to root
function OpenMainCppFilesSorted()
  -- Get the current working directory (root directory)
  local root_dir = vim.fn.getcwd()

  -- Open a new tab for the root directory
  --vim.cmd('tabedit ' .. root_dir)

  -- Find all main.cpp files in subdirectories and sort them
  local main_cpp_files = vim.fn.systemlist('find . -type f -name "main.cpp" | sort -r')
  if #main_cpp_files == 0 then
    print("No main.cpp files found.")
    return
  end

  -- Open each file as a new tab with CWD set to subdirectory
  for _, file in ipairs(main_cpp_files) do
    -- Open the file in a new tab with CWD set to the file's directory
    vim.cmd("tabedit " .. file)
    local file_dir = vim.fn.expand("%:p:h")
    vim.cmd("lcd " .. file_dir)
    vim.cmd("tabprevious")
  end
  vim.cmd("tabclose")
  print("All main.cpp files opened in NeoVim tabs with CWD set and sorted, returning to root.")
end

-- Adding fzf to runtime path vim.opt.runtimepath:append("/opt/homebrew/opt/fzf")

-- Number of colors (termguicolors for true color support)
vim.opt.termguicolors = true

-- Set background (optional)
-- vim.opt.background = "dark"

-- Set encoding for LaTeX plugin
vim.opt.encoding = "utf-8"

vim.opt.autoindent = true -- Enable auto-indentation
vim.opt.autoread = true -- Automatically read files when changed outside of Neovim
vim.opt.cindent = true -- Enable C-style indenting
vim.opt.expandtab = true -- Use spaces instead of tabs for indentation
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.incsearch = true -- Show search matches as you type
vim.opt.mousehide = true -- Hide mouse cursor while typing
vim.opt.errorbells = false -- Disable error bells
vim.opt.swapfile = false -- Disable swap file creation
vim.opt.number = true -- Show line numbers
--vim.opt.pastetoggle = "" -- Disable paste mode toggle
vim.opt.scrolloff = 15 -- Number of lines to keep above and below the cursor while scrolling
vim.opt.shiftwidth = 4 -- Number of spaces for each level of indentation
vim.opt.tabstop = 4 -- Number of spaces that <Tab> counts for
vim.opt.history = 1000 -- Number of command-line history entries to save
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.wrap = false -- Disable line wrapping
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.splitbelow = true -- Open new splits below the current one
vim.opt.splitright = true -- Open new splits to the right of the current one
--vim.opt.shellslash = true -- Use forward slashes for file paths in commands
--vim.opt.guicursor = "" -- Clear GUI cursor settings
vim.opt.guifont = "*" -- Set the default GUI font
vim.opt.iskeyword:append(":") -- Include ':' as part of a word when navigating
--vim.opt.syntax = "on" -- Enable syntax highlighting
vim.cmd([[set syntax=on]])
--vim.opt.filetype = "plugin indent on" -- Enable filetype detection and plugins
