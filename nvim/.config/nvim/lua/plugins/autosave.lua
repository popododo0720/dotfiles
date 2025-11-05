return {
  "okuuva/auto-save.nvim",
  lazy = false, -- 즉시 로드
  config = function()
    require("auto-save").setup({
      enabled = true, -- 자동 저장 활성화
      trigger_events = {
        immediate_save = { "BufLeave" }, -- 버퍼 벗어나면 즉시 저장
        defer_save = { "InsertLeave" }, -- Insert 모드 나가면 저장
      },

      debounce_delay = 500, -- 0.5초 후 저장
    })
  end,
}
