# Hackフォントをインストール
mkdir -p $HOME/.local/share/fonts/NerdFonts
wget -O $HOME/.local/share/fonts/NerdFonts/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip $HOME/.local/share/fonts/NerdFonts/Hack.zip -d $HOME/.local/share/fonts/NerdFonts
rm $HOME/.local/share/fonts/NerdFonts/Hack.zip
# フォントキャッシュを更新
fc-cache -fv
# ユーザーの.zshrcにTERM環境変数を設定
echo 'export TERM="xterm-256color"' >> $HOME/.zshrc

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
. $HOME/.cargo/env && \
cargo install sheldon eza bat procs ripgrep fd-find hexyl tokei git-delta tre

# Starship
cargo install starship --locked

# Create .config directory
if [ ! -d "/home/$USER/.config" ]; then
    mkdir -p "/home/$USER/.config"
fi

# Install dotfile
export TARGET_DIR=/home/$USER/.config/zsh

if [ ! -f /home/$USER/.config/zsh/lazy.zsh ]; then
    if [ -f /home/$USER/.zshrc ]; then
        mv /home/$USER/.zshrc /home/$USER/.zshrc.backup
    fi
    if [ -L "/home/$USER/.zshrc" ] || [ -f "/home/$USER/.zshrc" ]; then
        rm "/home/$USER/.zshrc"
    fi
    if [ -d "$TARGET_DIR" ]; then
        rm -rf "$TARGET_DIR"
    fi

    mkdir -p "$TARGET_DIR"
    mv .[!.]* ./* $TARGET_DIR

    ln -s "$TARGET_DIR/zshrc" "/home/$USER/.zshrc"
else
    echo '42pretty-Zsh Already installed'
fi
