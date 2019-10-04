set -x FZF_LEGACY_KEYBINDINGS 0
set -x fish_key_bindings fish_hybrid_key_bindings

set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

set -x PATH $HOME/bin $PATH
set -x GOPATH $HOME/go
set -x DOTFILES $HOME/dotfiles

set -x MANPAGER "nvim -c 'set ft=man' -"
set -x EDITOR nvim
set -x VISUAL nvim

set theme_color_scheme solarized-dark
set theme_nerd_fonts yes
