return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    require("osc52").setup({
      max_length = 0, -- 최대 길이 제한 없음
      silent = false, -- 복사 시 메시지 표시
      trim = false, -- 공백 제거 안 함
      tmux_passthrough = true, -- tmux 내에서도 작동
    })

    -- Clipboard provider 설정
    local function copy(lines, _)
      require("osc52").copy(table.concat(lines, "\n"))
    end

    local function paste()
      return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
    end

    vim.g.clipboard = {
      name = "osc52",
      copy = {
        ["+"] = copy,
        ["*"] = copy,
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
    }
  end,
}
