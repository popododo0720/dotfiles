-- 대용량 코드베이스 성능 최적화
return {
  -- 대용량 파일 자동 감지 및 기능 비활성화
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 1, -- 1MB 이상 파일
      pattern = { "*" },
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        -- "matchparen", -- 괄호 매칭은 유지
        "vimopts",
        "filetype",
      },
    },
  },

  -- TreeSitter 최적화
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- 특정 언어만 설치 (필요한 것만)
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript",
        "bash", "json", "yaml", "markdown",
      },
      -- 점진적 선택 (성능 향상)
      incremental_selection = { enable = false },
      -- 대용량 파일에서 treesitter 비활성화
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
  },

  -- Git signs 최적화 (큰 repo에서 느려지는 주범)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      max_file_length = 10000, -- 10000줄 이상 파일은 gitsigns 비활성화
      update_debounce = 200, -- git 상태 업데이트 딜레이 증가
    },
  },

  -- LSP 최적화
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- LSP 응답 타임아웃 설정
      vim.lsp.set_log_level("WARN") -- 로그 레벨 낮춤 (성능 향상)

      -- 대용량 파일에서 LSP 제한
      vim.api.nvim_create_autocmd("BufReadPre", {
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > 500000 then -- 500KB 이상
            vim.b[buf].large_file = true
            vim.cmd("syntax clear")
          end
        end,
      })
    end,
  },

  -- Autocompletion 최적화
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
        },
        menu = {
          max_items = 50, -- 최대 아이템 수 제한 (기본 200)
        },
      },
    },
  },
}
