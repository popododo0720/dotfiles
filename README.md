# Dotfiles

Neovim, Tmux, Bash 설정 파일

## 빠른 시작

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 설치되는 것들

- **Neovim** (최신 버전)
- **Tmux** + Navigator (nvim과 통합 이동)
- **LazyGit** (TUI Git 클라이언트)
- **Nerd Font** (아이콘 표시용)
- **기타**: ripgrep, fd-find, fzf, gcc, Node.js

## 아이콘 깨짐 해결

스크립트가 자동으로 Nerd Font를 설치하지만, **터미널 설정**에서 폰트를 변경해야 합니다:

### SSH 접속 시 (로컬 PC 터미널)
로컬 PC의 터미널 설정에서 폰트를 변경하세요:

- **Windows Terminal**: 설정 → 프로필 → 모양 → 글꼴 → `JetBrainsMono Nerd Font`
- **iTerm2 (Mac)**: Preferences → Profiles → Text → Font → `JetBrainsMono Nerd Font`
- **VSCode 터미널**: Settings → Terminal › Integrated: Font Family → `JetBrainsMono Nerd Font`
- **Alacritty**: `~/.config/alacritty/alacritty.yml`:
  ```yaml
  font:
    normal:
      family: "JetBrainsMono Nerd Font"
  ```

### 직접 서버 모니터 사용 시
서버에 설치된 폰트를 터미널 에뮬레이터에서 선택하세요.

## 주요 기능

### Neovim
- **플러그인**: LSP, DAP, Telescope, Neo-tree, Gitsigns, LazyGit 통합
- **테마**: Catppuccin
- **클립보드**: OSC52로 SSH 원격에서도 복사 가능

### 단축키
- `Ctrl+C` (Visual): 복사 (원격에서도 로컬 클립보드로)
- `Ctrl+V`: 붙여넣기
- `Space` + `gg`: LazyGit 열기
- `Ctrl+h/j/k/l`: nvim split과 tmux pane 통합 이동
- `Ctrl+t`: 터미널 토글

### LazyGit 사용법
- `?`: 도움말
- `Space`: Stage/Unstage
- `c`: Commit
- `P`: Push
- `p`: Pull
- `q`: 닫기

### Tmux
- `Ctrl+b %`: 좌우 분할
- `Ctrl+b "`: 위아래 분할
- `Ctrl+h/j/k/l`: Pane 이동 (nvim과 통합!)

### Bash Aliases
- `v`: nvim
- `ta`: tmux attach
- `tn`: tmux new -s
- `..`, `...`, `....`: 상위 디렉토리 이동

## 업데이트

설정 변경 후:
```bash
cd ~/dotfiles
git pull
./update.sh
```

## 구조

```
dotfiles/
├── nvim/.config/nvim/          # Neovim 설정
│   ├── lua/
│   │   ├── config/            # 기본 설정
│   │   └── plugins/           # 플러그인 설정
│   └── init.lua
├── tmux/.config/tmux/          # Tmux 설정
│   └── tmux.conf
├── bash/                       # Bash 설정
│   └── .bashrc_custom
├── install.sh                  # 초기 설치
└── update.sh                   # 설정 업데이트
```
