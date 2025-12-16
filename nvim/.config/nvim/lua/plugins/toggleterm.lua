return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15 -- 가로 분할 시 높이
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4 -- 세로 분할 시 너비 (40%)
        end
      end,
      open_mapping = [[<c-\>]], -- Ctrl+\ 로 토글
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- insert 모드에서도 단축키 작동
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true, -- insert 모드 유지
      direction = "float", -- 기본: float (horizontal, vertical, tab도 가능)
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved", -- 테두리: single, double, curved, shadow
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.85)
        end,
        winblend = 3, -- 투명도
      },
    })

    -- 터미널 1, 2, 3 (숫자로 간단하게)
    vim.keymap.set({ "n", "t" }, "<leader>1", function()
      vim.cmd("1ToggleTerm")
    end, { desc = "Terminal 1" })

    vim.keymap.set({ "n", "t" }, "<leader>2", function()
      vim.cmd("2ToggleTerm")
    end, { desc = "Terminal 2" })

    vim.keymap.set({ "n", "t" }, "<leader>3", function()
      vim.cmd("3ToggleTerm")
    end, { desc = "Terminal 3" })
  end,
}
