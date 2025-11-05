return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "│" }, -- 추가된 줄
      change = { text = "│" }, -- 변경된 줄
      delete = { text = "_" }, -- 삭제된 줄
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true, -- 현재 줄에 git blame 표시
    current_line_blame_opts = {
      delay = 500, -- 0.5초 후 표시
    },
  },
  keys = {
    { "<leader>gb", ":Gitsigns blame_line<cr>", desc = "Git blame" },
    { "<leader>gp", ":Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
    { "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
  },
}
