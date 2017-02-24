set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

set -x EDITOR nvim
set -x VISUAL nvim

set -x PATH $HOME/bin $PATH

set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes
