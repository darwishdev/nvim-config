return {

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open Lazygit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      -- Optional UI tweaks
      vim.g.lazygit_floating_window_winblend = 10
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_use_neovim_remote = true
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,  -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      update_debounce = 100,
      status_formatter = nil,  -- Use default
    },
  },
}
