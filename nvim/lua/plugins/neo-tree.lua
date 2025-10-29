return {
  "nvim-neo-tree/neo-tree.nvim",

  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" }, -- Space+e: 파일 트리 열기/닫기
  },

  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = "▸",
        folder_open = "▾",
        folder_empty = "▸",
        default = "",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- false: .파일 보이기 (true: 숨김)
        hide_gitignored = false, -- false: .gitignore 파일도 보이기
      },
      follow_current_file = {
        enabled = true, -- true: 현재 열린 파일 위치로 트리 자동 이동
      },
      use_libuv_file_watcher = true, -- 파일 변경 자동 감지 (생성/삭제/이름변경 실시간 반영)
    },
    window = {
      width = 30, -- 트리 창 너비 (숫자 = 고정 너비, 0.3 = 화면의 30%)
      position = "left", -- 위치: left(왼쪽), right(오른쪽), float(떠있는 창)
    },
  },
}
