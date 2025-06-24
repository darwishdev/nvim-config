return {

	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
			})
			vim.cmd.colorscheme("tokyonight")

			-- clear standard groups
			for _, grp in ipairs({
				"Normal",
				"NormalFloat",
				"SignColumn",
				"VertSplit",
				"StatusLine",
				"LineNr",
				"EndOfBuffer",
			}) do
				vim.api.nvim_set_hl(0, grp, { bg = "none" })
			end

			-- clear all Telescope groups
			for _, group in ipairs({
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptNormal",
				"TelescopePromptBorder",
				"TelescopePromptTitle",
				"TelescopePromptPrefix",
				"TelescopeResultsNormal",
				"TelescopeResultsBorder",
				"TelescopeResultsTitle",
				"TelescopePreviewNormal",
				"TelescopePreviewBorder",
				"TelescopePreviewTitle",
			}) do
				vim.api.nvim_set_hl(0, group, { bg = "none" })
			end
		end,
	},
}
