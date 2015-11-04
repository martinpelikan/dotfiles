case $- in
  # Hack to work around not having passwd/chsh access
  *i*)
    # Interactive session. Try switching to zsh.
    if [ -z "$ZSH" ]; then # do nothing if running under zsh already
      zsh=$(command -v zsh)
      if [ -x "$zsh" ]; then
        export SHELL="$zsh"
        exec "$zsh"
      fi
    fi
esac
