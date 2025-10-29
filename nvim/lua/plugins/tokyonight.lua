return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon", -- 테마 스타일: storm(청록), moon(보라), night(어두운파랑), day(밝음)
    transparent = false, -- 배경 투명 (true하면 터미널 배경 보임)
    terminal_colors = true, -- 터미널 색상도 테마 적용
    styles = {
      comments = { italic = true }, -- 주석 이탤릭
      keywords = { italic = true }, -- 키워드(if, for 등) 이탤릭
      functions = {}, -- 함수명 스타일 (비움 = 기본)
      variables = {}, -- 변수명 스타일
      sidebars = "dark",
      floates = "dark",
    },
  },
}
