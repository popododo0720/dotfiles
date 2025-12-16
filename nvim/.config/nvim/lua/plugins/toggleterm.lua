return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15, -- 하단 터미널 높이
      open_mapping = [[<c-\>]], -- Ctrl+\ 로 토글
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal", -- 기본: 하단 (Ctrl+\ 눌렀을 때)
      close_on_exit = true,
      shell = vim.o.shell,
    })

    -- 터미널 1, 2, 3 (하단에 열리고 토글 가능)
    vim.keymap.set({ "n", "t" }, "<leader>1", function()
      vim.cmd("1ToggleTerm direction=horizontal")
    end, { desc = "Terminal 1" })

    vim.keymap.set({ "n", "t" }, "<leader>2", function()
      vim.cmd("2ToggleTerm direction=horizontal")
    end, { desc = "Terminal 2" })

    vim.keymap.set({ "n", "t" }, "<leader>3", function()
      vim.cmd("3ToggleTerm direction=horizontal")
    end, { desc = "Terminal 3" })

    -- 터미널에서 ESC 누르면 터미널 닫기 (토글)
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:ToggleTerm<CR>]], { desc = "Close terminal" })
  end,
}
