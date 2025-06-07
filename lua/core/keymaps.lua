-- ~/.config/nvim/lua/core/keymaps.lua

-- Telescope keymaps
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<esc><cmd>w<cr>", { desc = "Save file" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--
-- LSP keymaps

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Check if the client is valid
    if not client then
      return
    end

    -- Hover
    if client.server_capabilities.hoverProvider then
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover" })
    end

    -- Go to definition
    if client.server_capabilities.definitionProvider then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
    end

    -- Code actions
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code action" })
    end

    -- References
    if client.server_capabilities.referencesProvider then
      vim.keymap.set("n", "gr", function()
        require('telescope.builtin').lsp_references()
      end, { buffer = args.buf, desc = "Find references with Telescope" })
    end
    -- Rename
    if client.server_capabilities.renameProvider then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename symbol" })
    end

    -- Implementation
    if client.server_capabilities.implementationProvider then
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf, desc = "Go to implementation" })
    end

    -- Signature help
    if client.server_capabilities.signatureHelpProvider then
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { buffer = args.buf, desc = "Signature help" })
    end

    -- Type definition
    if client.server_capabilities.typeDefinitionProvider then
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = args.buf, desc = "Go to type definition" })
    end

    -- Formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = args.buf, desc = "Format document" })
    end

    -- Diagnostics
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = args.buf, desc = "Open diagnostic float" })
  end,
})
-- Toggle Netrw with Ctrl+B
vim.keymap.set("n", "<C-b>", "<cmd>Explore<cr>", { desc = "Toggle file explorer" })
