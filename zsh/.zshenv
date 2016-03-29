# Bit of a hack to deal with machine-specific variables
case $HOST in
    (arch)
        # systemd starts ssh-agent in home setup
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
        ;;
    (*)
        : ;;
esac

# Used by agnoster/powerlevel9k to minify prompt length
# zshenv only loaded at startup, so let the user at that point define the default user
if [ -z "$SSH_CLIENT" ]
then
    export DEFAULT_USER=$USER
fi

# Why is this not a default on every system ever?
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
elif hash vim 2>/dev/null; then
    export EDITOR=vim
    export VISUAL=vim
fi

# Custom binaries go in ~/bin
export PATH=$PATH:$HOME/bin
# This is a lie, but needed to make some apps happy...
export TERM='xterm-256color'
# For gdrive
export GOPATH=$HOME/go
# For apps that need it explicitly set
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# Pseudo-XDG support
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
