-- lua/plugins/linting.lua
return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "InsertLeave" },
		config = function()
			local lint = require("lint")

			-- choose your linters; these names come from nvim-lint's built-in list :contentReference[oaicite:1]{index=1}
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				vue = { "eslint" },
				go = { "golangcilint" },
				proto = { "buf_lint" },
				-- add others as needed…
			}

			-- Auto-lint on these events
			vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
