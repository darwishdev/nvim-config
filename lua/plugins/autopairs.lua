return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- use treesitter to detect valid pairs
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					-- add more ft-specific rules if you like
				},
				fast_wrap = {
					map = "<M-e>", -- Alt+e to wrap
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					offset = 0, -- how many chars before wrap
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl;",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})

			-- Optional: integrate with nvim-cmp so confirm also auto-inserts pair
			local has_cmp, cmp = pcall(require, "cmp")
			if has_cmp then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
			end
		end,
	},
}
