return {
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify") -- Override default notify
			require("notify").setup({
				stages = "fade_in_slide_out",
				timeout = 3000,
				render = "default",
				background_colour = "#000000",
			})
		end,
	},
}
