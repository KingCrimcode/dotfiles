vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, { desc = "Code action" } )
vim.keymap.set("n", "gr", function() vim.lsp.buf.rename() end, { desc = "Rename" })
vim.keymap.set("n", "K",  function() vim.lsp.buf.hover() end, { desc = "Hover symbol" })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
  virtual_text = true,
  update_in_insert = true,
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
  "clangd",
  "gopls",
  "lua_ls",
  "pylsp",
  "qmlls"
})
