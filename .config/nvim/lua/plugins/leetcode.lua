return {
	"kawre/leetcode.nvim",
	lazy = false,
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- configuration goes here
		injector = { ---@type table<lc.lang, lc.inject>
			["python3"] = {
				before = true
			},
			["cpp"] = {
				before = {"using namespace std;" },
				after = "int main() {}",
			},
			["java"] = {
				before = "import java.util.*;",
			},
		}
	},
}
