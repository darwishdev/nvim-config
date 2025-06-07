
-- Example: Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function()
    vim.bo.commentstring = "<!-- %s -->"
  end,
})
