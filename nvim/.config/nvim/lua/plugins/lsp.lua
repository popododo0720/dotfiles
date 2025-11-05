return {
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "stylua", -- Lua 포매터
        "tree-sitter-cli", -- 문법 파서
      })
    end,
  },
  {
    "mason-lspconfig.nvim", -- LSP 자동 설치
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "lua_ls",
        "pyright",
        "ts_ls",
        "clangd",
      })
    end,
  },
}
