return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",  -- 이벤트 변경
  config = function()
    require("neoscroll").setup({
      easing_function = "quadratic",  -- 부드러운 곡선
      hide_cursor = true,             -- 스크롤 중 커서 숨김
      stop_eof = true,                -- 파일 끝에서 멈춤
      respect_scrolloff = true,       -- scrolloff 설정 존중
      cursor_scrolls_alone = true,    -- 커서만 스크롤 가능
    })
  end,
}
