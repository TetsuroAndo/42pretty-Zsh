#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source the cargo environment
source $HOME/.cargo/env

# Install tools using cargo
cargo install sheldon eza bat procs ripgrep fd-find hexyl tokei git-delta tre

