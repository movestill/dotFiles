local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Format with prettier as first choice, but fallback to eslint for the
    -- project that only uses eslint.
    typescript = {
      { "prettier", "eslint_d" },
    },
    typescriptreact = {
      { "prettier", "eslint_d" },
    },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
