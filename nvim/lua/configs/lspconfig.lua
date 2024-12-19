local original_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_attach = function(client, bufnr)
  local map = vim.keymap.set
  original_on_attach(client, bufnr)

  -- Replace NvRenamer UI mapping with standard Vim renaming interface.
  map("n", "<Leader>ra", function()
    vim.lsp.buf.rename()
  end, { buffer = bufnr, desc = "LSP Rename symbol" })

  -- Remove signature help mapping that interferes with my <leader>s save.
  vim.keymap.del("n", "<leader>sh")
end

local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "eslint", "ruff", "jedi_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
