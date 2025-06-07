-- ~/.config/nvim/lua/plugins/null-ls.lua

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.gofmt,       -- Standard Go formatting
        null_ls.builtins.formatting.goimports,   -- Organize imports on save
-- Vfe & JavaScript/TypeScript formatters
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "vue", "javascript",  "css", "json", "yaml", "html" },
        }),

        -- Vue & JavaScript/TypeScript diagnostics
         null_ls.builtins.diagnostics.eslint_d.with({
           filetypes = { "vue", "javascript","typescript" },
         }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false }) -- Auto-format on save
            end,
          })
        end
      end,
    })
  end,
}

