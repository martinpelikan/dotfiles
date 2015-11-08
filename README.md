dotfiles
========
This project will eventually provide a set of scripts/dotfiles to set up a
Martin-esque dev environment for Arch installs, once the initial install of the
distro is complete.

Stow
----
[GNU Stow](https://www.gnu.org/software/stow/) will create symlinks to the
`dotfiles` directory from the default application paths.

`stow -R bash i3 neovim  pudb vim x zsh`

Vim
---
```Shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```VimL
:PlugInstall
```

