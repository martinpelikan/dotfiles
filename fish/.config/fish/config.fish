set -x FZF_LEGACY_KEYBINDINGS 0

set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

set -x PATH $HOME/bin $HOME/.gem/ruby/2.4.0/bin $HOME/bin/kaitai-struct-compiler-0.8-SNAPSHOT/bin $PATH
set -x GOPATH $HOME/go

set -x EDITOR nvim
set -x VISUAL nvim

# rg seems to be flaky in some circumstances
# set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'

set theme_color_scheme solarized-dark
set theme_nerd_fonts yes
