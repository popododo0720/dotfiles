return {
  "nvim-neo-tree/neo-tree.nvim",

  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
  },

  opts = {
    close_if_last_window = false,
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
        visible = true, -- 필터링된 항목도 회색으로 표시
        hide_dotfiles = false, -- dotfile 숨기지 않기
        hide_gitignored = false,
        hide_hidden = false,
        never_show = { -- 완전히 숨길 것만
          ".git",
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "left",
      width = 30,
    },
  },
}
