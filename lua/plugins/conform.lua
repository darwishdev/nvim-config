
-- lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        -- you can override default timeout, async behavior, etc. here
        -- see https://github.com/stevearc/conform.nvim#setup :contentReference[oaicite:0]{index=0}
        formatters_by_ft = {
          lua        = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          vue        = { "prettier" },
          css        = { "prettier" },
          html       = { "prettier" },
          json       = { "prettier" },
          yaml       = { "prettier" },
          go         = { "gofmt", "goimports" },
          proto      = { "buf format" },
        },
      })

      -- Auto-format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          require("conform").format({ async = false })
        end,
      })
    end,
  },
}
