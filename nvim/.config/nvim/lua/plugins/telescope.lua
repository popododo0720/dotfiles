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
      file_ignore_patterns = {
        "node_modules", ".git/", "%.lock",
        "vendor/", "build/", "dist/", "target/",
        "__pycache__/", "%.pyc", "%.pyo",
      },
      layout_strategy = "horizontal",
      layout_config = {
        preview_width = 0.6,
      },
      -- 성능 최적화
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden", -- 숨김 파일도 검색
        "--max-filesize=1M", -- 1MB 이상 파일 제외
      },
      cache_picker = { num_pickers = 10 }, -- 최근 검색 캐싱
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--max-results=5000" },
      },
    },
  },
}
