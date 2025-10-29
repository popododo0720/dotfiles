-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 창 분할
map("n", "<leader>|", ":vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>-", ":split<cr>", { desc = "Split horizontally" })

-- 창 이동
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down window" })

map("n", "<C-k>", "<C-w>k", { desc = "Up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })

-- 창 크기 조절
map("n", "<C-Up>", ":resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", ":resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "Increase width" })

-- Snacks 터미널 토글 (Ctrl+t)
map("n", "<C-t>", function()
  Snacks.terminal()
end, { desc = "Toggle terminal" })
map("t", "<C-t>", function()
  Snacks.terminal()
end, { desc = "Toggle terminal" })

-- 터미널 모드 나가기
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Neoscroll 부드러운 스크롤 (플러그인 로드 후 적용)
vim.defer_fn(function()
  if pcall(require, "neoscroll") then
    local neoscroll = require("neoscroll")
    vim.keymap.set({"n", "v"}, "<C-u>", function() neoscroll.ctrl_u({ duration = 120 }) end)
    vim.keymap.set({"n", "v"}, "<C-d>", function() neoscroll.ctrl_d({ duration = 120 }) end)
    vim.keymap.set({"n", "v"}, "<C-b>", function() neoscroll.ctrl_b({ duration = 120 }) end)
    vim.keymap.set({"n", "v"}, "<C-f>", function() neoscroll.ctrl_f({ duration = 120 }) end)
  end
end, 100)
