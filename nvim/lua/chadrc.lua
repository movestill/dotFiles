-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig

local M = {}

M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  theme = "tokyodark",
  statusline = {
    separator_style = "arrow",
    order = { "mode", "file", "modified", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      modified = function()
        local modified = ""
        if vim.api.nvim_buf_get_option(M.stbufnr(), "modified") then
          modified = "%#StText# [+]"
        end
        return modified
      end,

      cursor = function()
        return "%#St_pos_sep#" .. "" .. "%#St_pos_icon# %#StText# Ln %l, Col %c "
      end,
    },
  },

  hl_override = {
    Visual = {
      bg = { "blue", 5 },
    },
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
  },
}

return M
