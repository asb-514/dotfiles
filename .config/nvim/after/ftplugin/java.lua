-- Setup our JDTLS server any time we open up a java file
vim.cmd [[
  lua require'config.jdtls'.setup_jdtls()
]]
