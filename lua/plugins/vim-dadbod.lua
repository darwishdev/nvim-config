return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },

  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1


    -- Optional: Don't ask to save queries
    vim.g.db_ui_save_location = "~/.config/nvim/db_ui_queries"

    -- Set default connection(s)
    vim.g.dbs = {
      ["local_supabase"] = "postgres://postgres:postgres@127.0.0.1:54322/postgres"
    }
  end,
}
