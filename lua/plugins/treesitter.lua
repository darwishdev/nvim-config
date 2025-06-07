-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "go", "python", "json", "proto", "yaml",
          "html", "css", "javascript", "typescript", "vue"
        },
        sync_install = false,         -- default: false
        auto_install = true,
        ignore_install = {},          -- default: {}
        highlight = { enable = true },
        indent = { enable = true },
        modules = {},                 -- add this to satisfy the type checker
      })
    end,  },
}
