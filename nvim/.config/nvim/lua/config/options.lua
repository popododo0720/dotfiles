-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 성능 최적화 (큰 코드베이스용)
vim.opt.updatetime = 100 -- CursorHold 이벤트 딜레이 감소
vim.opt.timeoutlen = 300 -- 키 입력 대기 시간
vim.opt.redrawtime = 1500 -- syntax 강조 최대 시간
vim.opt.synmaxcol = 300 -- syntax 강조 최대 컬럼 (매우 긴 줄 최적화)

-- swap/backup 최적화
vim.opt.swapfile = false -- swap 파일 비활성화 (성능 향상)
vim.opt.backup = false
vim.opt.writebackup = false
