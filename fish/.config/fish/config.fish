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

set -x PIP_REQUIRE_VIRTUALENV true

set theme_color_scheme solarized-dark
set theme_nerd_fonts yes

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# rg seems to be flaky in some circumstances
# set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
