# # Brew PATH
# eval $(/opt/homebrew/bin/brew shellenv)

# Git
export GIT_CONFIG_GLOBAL=$HOME/src/mac-dotfiles/git/.gitconfig

PROMPT=$'
%F{201}%n@%m%f \U1F4C2 %F{039}%~%f | %F{046}%D %*%f
%F{099}\U276F%f '

# Starship
# export STARSHIP_CONFIG=$HOME/src/mac-dotfile/starship.toml
# eval "$(starship init zsh)"