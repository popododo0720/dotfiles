-- lazy.nvim 플러그인 파일에 추가 (보통 ~/.config/nvim/lua/plugins/ 폴더)
return {
  'ojroques/nvim-osc52',
  config = function()
    require('osc52').setup {
      silent = true,
    }
    
    -- y 키로 복사하면 자동으로 클립보드에도 복사
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end
    
    vim.g.clipboard = {
      name = 'osc52',
      copy = { ['+'] = copy, ['*'] = copy },
      paste = { ['+'] = paste, ['*'] = paste },
    }
  end
}
