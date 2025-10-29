return {
  "stevearc/conform.nvim", -- 포매터
  opts = {
    formatters_by_ft = {
      lua = { "stylua" }, -- Lua
      python = { "ruff_format", "ruff_fix" }, -- Python (ruff)
      javascript = { "prettier" }, -- JS
      typescript = { "prettier" }, -- TS
      javascriptreact = { "prettier" }, -- JSX
      typescriptreact = { "prettier" }, -- TSX
      css = { "prettier" }, -- CSS
      html = { "prettier" }, -- HTML
      json = { "prettier" }, -- JSON
      yaml = { "prettier" }, -- YAML
      markdown = { "prettier" }, -- Markdown
      c = { "clang_format" }, -- C
      cpp = { "clang_format" }, -- C++
    },
    format_on_save = {
      timeout_ms = 500, -- 포매팅 타임아웃
      lsp_fallback = true, -- LSP 포매터로 fallback
    },
  },
}
