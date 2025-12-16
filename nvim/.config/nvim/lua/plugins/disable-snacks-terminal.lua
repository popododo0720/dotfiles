-- Snacks 터미널만 비활성화 (toggleterm 사용)
return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      enabled = false, -- 터미널 기능만 끔
    },
  },
}
