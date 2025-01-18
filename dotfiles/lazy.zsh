### some more aliases
alias c=clear
alias ls='ls --color=auto'
alias ll='ls -CFl'
alias la='ls -CFA'
alias l='ls -CF'
alias lla='ls -CFlA'

# git
alias autopush='git pull && git add . && git commit -m "Auto commit to $(date '+%Y-%m-%d %H:%M:%S')" && git push'
alias push='git push'
alias apush='git add . && git commit -m "Auto commit to $(date '+%Y-%m-%d %H:%M:%S')" && git push'
alias pul=git pull

# tree script
alias tree='python3 $HOME/src/my-tree-command/tree.py'

# nvim aliase
alias nv='nvim'

# clang comp
alias ccw='gcc -Wall -Wextra -Werror'
alias ccx=$HOME/src/cc-alias-script/compile_run.sh
alias cx=$HOME/src/cc-alias-script/compile_run_w3.sh

# 42 norm Check
alias norm='norminette -R CheckForbiddenSourceHeader'
alias normd='norminette -R CheckDefine'

# Memory Check
alias valgrind-leak='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'
alias valgrind-mem='valgrind --tool=memcheck --leak-check=full --show-reachable=yes --num-callers=20 --track-fds=yes'

# Alacritty 42Ubuntu
alias alacritty='nohup alacritty >/dev/null 2>&1 &'
alias a='setsid alacritty </dev/null &>/dev/null &'

# code
alias code=/usr/share/code/bin/code

# # tools
# alias cat='bat'
# alias grep='rg'
# alias find='fd'
# alias od='hexyl'
# alias wc='tokei'
# alias diff='delta'

### PATH 
export PATH=$HOME/.local/bin:$PATH

# Rust cargo
$HOME/.cargo/env

### Tools
#tre
tre() { command tre "$@" -e vim && source "/tmp/tre_aliases_$USER" 2>/dev/null; }


### key binding
bindkey ';5C' end-of-line                     # ctrl + ->
bindkey ';5D' beginning-of-line               # ctrl + <-
bindkey ';3C' forward-word                    # alt + ->
bindkey ';3D' backward-word                   # alt + <-
bindkey ';9A' beginning-of-buffer-or-history    # page up
bindkey ';9B' end-of-buffer-or-history          # page down
bindkey ';2C' forward-char                    # ctrl + ->
bindkey ';2D' backward-char                   # ctrl + <-

### 保管機能
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d' # 補完候補の説明をフォーマットします  
zstyle ':completion:*' completer _expand _complete _correct _approximate # 補完候補を生成するためのコンプリータを指定します
zstyle ':completion:*' format 'Completing %d' # 補完候補のフォーマットを指定します
zstyle ':completion:*' group-name '' # グループ名を指定します
zstyle ':completion:*' menu select=2 # 補完候補のメニューを指定します
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # リストの色を指定します
zstyle ':completion:*' list-colors '' # リストの色を指定します
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s # リストのプロンプトを指定します
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' # マッチャーリストを指定します
zstyle ':completion:*' menu select=long # メニューを指定します
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s # 選択プロンプトを指定します
zstyle ':completion:*' use-compctl false # コマンドラインコントロールを使用しないようにします
zstyle ':completion:*' verbose true # 詳細なメッセージを表示します
# 特定の補完設定
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31' # プロセスのリストの色を指定します
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd' # プロセスのリストを指定します

# zsh-syntax-highlightingの設定
if [ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
  ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[path]=bold
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
  ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
  ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[command-substitution]=none
  ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[process-substitution]=none
  ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[assign]=none
  ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
  ZSH_HIGHLIGHT_STYLES[named-fd]=none
  ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
  ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi
