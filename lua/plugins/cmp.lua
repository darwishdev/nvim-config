-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      'kristijanhusak/vim-dadbod-completion',
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",


    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },


        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),


          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "emmet_ls" },
          { name = 'vim-dadbod-completion' },
          { name = "buffer" },
          { name = 'vim-dadbod-completion' },
          { name = "path" },
        }),

      })

      cmp.setup.filetype({ 'sql' }, {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      })
    end,
  },
}
