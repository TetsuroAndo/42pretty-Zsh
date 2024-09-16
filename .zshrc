# ZSHRC_DIR変数の設定。現在のスクリプトのディレクトリを取得しています。
ZSHRC_DIR=${${(%):-%N}:A:h}

# sourceコマンドをオーバーライドするための関数定義
function source {
  # コンパイルされたファイルが最新か確認し、必要に応じてコンパイル
  ensure_zcompiled $1
  # 組み込みのsourceコマンドを使用
  builtin source $1
}

# 指定されたファイルがコンパイルされているか確認し、必要に応じてコンパイルする関数
function ensure_zcompiled {
  local compiled="$1.zwc"
  # コンパイル済みファイルが読み取り可能でない、または古い場合はコンパイル
  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
    echo "\033[1;36mCompiling\033[m $1"
    zcompile $1
  fi
}
# .zshrcファイル自体をコンパイル
ensure_zcompiled ~/.zshrc

# sheldonキャッシュ技術の設定
export SHELDON_CONFIG_DIR="$ZSHRC_DIR/sheldon"
sheldon_cache="$SHELDON_CONFIG_DIR/sheldon.zsh"
sheldon_toml="$SHELDON_CONFIG_DIR/plugins.toml"
# キャッシュファイルが読み取り可能でない、または古い場合はsheldonを使ってソースを生成
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  sheldon source > $sheldon_cache
fi
# キャッシュファイルをソースとして読み込む
source "$sheldon_cache"
# 不要になった変数を解除
unset sheldon_cache sheldon_toml

# 非遅延ファイルをソースとして読み込む
source $ZSHRC_DIR/nonlazy.zsh
# 遅延ファイルをソースとして読み込む（遅延実行）
zsh-defer source $ZSHRC_DIR/lazy.zsh
# source関数をアンセット（遅延実行）
zsh-defer unfunction source

# Settings
HISTFILE="$HOME/.zsh_history" # Set the path to the zsh history file
setopt SHARE_HISTORY        # 履歴を共有します
setopt hist_ignore_dups     # 履歴リスト内で重複するコマンドを無視します
setopt hist_ignore_space    # スペースで始まるコマンドを履歴に保存しないようにします
setopt hist_verify          # 履歴展開を行う前にコマンドをユーザーに確認させます
setopt histignorealldups sharehistory # 重複するコマンドを履歴に保存しないようにし、履歴を共有します
#setopt correct            # auto correct mistakes
setopt autocd              # 名前だけでディレクトリに変更できます
setopt interactivecomments # 対話モードでコメントを許可します
setopt magicequalsubst     # ‘anything=expression’形式の引数でファイル名展開を有効にします
setopt nonomatch           # パターンに一致するものがない場合のエラーメッセージを隠します
setopt notify              # バックグラウンドジョブの状態を即座に報告します
setopt numericglobsort     # 論理的な場合にファイル名を数値でソートします
setopt promptsubst         # プロンプトでのコマンド置換を有効にします
