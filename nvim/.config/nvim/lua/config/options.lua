-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus" -- y, p 명령이 시스템 클립보드(+) 사용

vim.g.clipboard = {
  name = "OSC 52", -- 클립보드 프로토콜 이름

  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"), -- + 레지스터 복사 시 OSC 52로 로컬에 전송
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"), -- * 레지스터도 동일
  },

  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"), -- 붙여넣기 (SSH에선 보통 안 됨)
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
