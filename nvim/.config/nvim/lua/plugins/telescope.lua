return {
  "nvim-telescope/telescope.nvim",

  keys = { -- 키맵 설정
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" }, -- Space+ff: 파일명 검색
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" }, -- Space+fg: 파일 내용 검색
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" }, -- Space+fb: 열린 파일 목록
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" }, -- Space+fh: 도움말 검색
  },

  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" }, -- 검색에서 제외할 폴더
      layout_strategy = "horizontal", -- 레이아웃: horizontal(가로), vertical(세로), center
      layout_config = {
        preview_width = 0.6, -- 미리보기 창 너비 (0.6 = 60%)
      },
    },
  },
}
