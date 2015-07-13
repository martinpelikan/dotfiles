# Bit of a hack to deal with machine-specific variables
case $HOST in
    (arch)
        # systemd starts ssh-agent at home
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
        # Some things are different on other machines
        if [ -z "$SSH_CLIENT" ]
        then
            # Used by agnoster/powerlevel9k to minify prompt length
            export DEFAULT_USER="mpelikan"
        fi;;
    (*)
        if [ -z "$SSH_CLIENT" ]
        then
            export DEFAULT_USER="martin"
        fi;;
esac
# Why is this not a default on every system ever?
export EDITOR=nvim
export VISUAL=nvim
# This is a lie, but needed to make some apps happy...
export TERM='xterm-256color'
export PATH=$PATH:$HOME/bin
