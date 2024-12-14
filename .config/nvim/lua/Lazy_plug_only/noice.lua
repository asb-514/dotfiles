return {
	"folke/noice.nvim",
	opts = {
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
			{
				view = "mini",
				filter = { event = "msg_showmode" },
			},
		},
	},
}
