-- ~/.config/nvim/lua/plugins/lsp.lualsp

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")


-- Setup Protols
lspconfig.efm.setup({
  filetypes = { "proto" },
  init_options = { documentFormatting = true, documentLinting = true },
  settings = {
    languages = {
      proto = {
        {
          lintCommand = "buf lint --error-format=json",
          lintFormats = { "%f:%l:%c:%t:%m" },
          formatCommand = "buf format -",
          formatStdin = true,
        },
      },
    },
  },
})      -- TypeScript Language Server (ts_ls)

      -- Vue Language Server (Volar)

      lspconfig.volar.setup({
        init_options = {
          typescript = {
            tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
          },
        },

        filetypes = {"vue"},
        languageFeatures = {
          references = true,
          definition = true,
          typeDefinition = true,
          callHierarchy = true,
          hover = true,
          rename = true,
          signatureHelp = true,
          codeAction = true,
          completion = {
            defaultTagNameCase = "both",
            defaultAttrNameCase = "kebabCase",
            getDocumentNameCasesRequest = false,
            getDocumentSelectionRequest = false,
          },
        },
      })

      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/opt/homebrew/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
              languages = {  "vue"},
            },
          },
        },
        filetypes = { "javascript", "typescript" ,"vue" },
      })
      lspconfig.html.setup({
        filetypes = { "html", "templ" },
        root_dir = lspconfig.util.root_pattern(".git", "package.json", ".nvim"), -- Detect project root
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true
          }
        }
      })

      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      -- lspconfig.eslint.setup({
      --   settings = {
      --     run = "onSave",
      --     format = true,
      --     lintTask = { enable = true },
      --   },
      -- })
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              nilness = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
      lspconfig.pyright.setup({}) -- Python
      -- Configure lua_ls (Lua Language Server)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Use LuaJIT as the runtime
            },
            diagnostics = {
              globals = { "vim" }, -- Tell the LSP to recognize `vim` as a global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
              checkThirdParty = false, -- Disable third-party library checks
            },
            telemetry = {
              enable = false, -- Disable telemetry
            },
          },
        },
      })
    end,
  },
}
