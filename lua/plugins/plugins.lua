
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.lsp" }, -- LSP setup
  { import = "plugins.treesitter" }, -- Treesitter setup
  { import = "plugins.cmp" }, -- nvim-cmp setup
  { "nvim-lua/plenary.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" }, -- ESLint integration

  { import = "plugins.telescope" }, -- Telescope setup
  { import = "plugins.null-ls" },
  { import = "plugins.vim-tmux-navigator" },
  { import = "plugins.vim-dadbod" },

  'kristijanhusak/vim-dadbod-completion',
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Auto Close Tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
})
