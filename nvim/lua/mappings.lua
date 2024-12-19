require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

map("n", "<Leader>q", ":q<Enter>", { desc = "Buffer close" })
map("n", "<Leader>s", ":w<Enter>", { desc = "Buffer save" })

map("n", "<Leader>b", function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    ignore_current_buffer = true,
  }
end, { desc = "Telescope Find buffers" })
map("n", "<Leader>p", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find files" })
map("n", "<Leader>fg", "<cmd>Telescope grep_string<CR>", { desc = "Telescope grep string" })

map("n", "<Leader>w", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- This clashes with the default theme picker.
-- map("n", "<Leader>t", "vim.lsp.buf.hover")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local nomap = vim.keymap.del

-- Disable lsp floating diagnostics.
nomap("n", "<Leader>lf")

-- Disable Telescope mappings that I've mapped to other keys.
nomap("n", "<leader>fb") -- find buffers
nomap("n", "<leader>ff") -- find files

-- Disable which-key mappings.
nomap("n", "<Leader>wk")
nomap("n", "<Leader>wK")

-- Disble nvchad buffer navigation.
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")
