return {
  {
    "mason.nvim", -- Formatter/Linter 설치 관리자
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Formatter
        "stylua", -- Lua 포매터
        "ruff", -- Python 포매터
        "clang-format", -- C/C++ 포매터
        "prettier", -- JS/TS/HTML/CSS 포매터
        -- Linter
        "eslint_d", -- JS/TS 린터
        "cpplint", -- C/C++ 린터
        -- Others
        "tree-sitter-cli", -- 문법 파서
      })
    end,
  },
  {
    "mason-lspconfig.nvim", -- LSP 자동 설치
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "lua_ls", -- Lua LSP
        "pyright", -- Python LSP
        "ts_ls", -- TypeScript/JavaScript LSP
        "clangd", -- C/C++ LSP
      })
    end,
  },
}
