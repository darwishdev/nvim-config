return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true, -- replaces netrw
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory (Oil)" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
	},
}
