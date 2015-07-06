# Bit of a hack to deal with machine-specific variables
case $HOST in
  (arch)
      # Used by agnoster/powerlevel9k to minify prompt length
      DEFAULT_USER='mpelikan'
      # systemd starts ssh-agent at home
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket";;
  (*)
      DEFAULT_USER='martin';;
esac
# Why is this not a default on every system ever?
export EDITOR=nvim
export VISUAL=nvim
