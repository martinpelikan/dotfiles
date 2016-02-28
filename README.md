dotfiles
========
This project will eventually provide a set of scripts/dotfiles to set up my
ideal dev environment in a minimal Arch install.

Stow
----
[GNU Stow](https://www.gnu.org/software/stow/) will create symlinks to the
`dotfiles` directory from the default application paths.

From the dotfiles directory, run:
```Shell
stow -R bash i3 neovim  pudb vim x zsh
```

vim/neovim
----------
Bootstrap the vim-plug plugin manager:
```Shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then install all the plugins in vim:
```VimL
:PlugInstall
```

i3config
--------
The [i3config](./i3/.i3/config) is templated using
[j4tools](http://www.j4tools.org/). Make modifications to
[config.base](./i3/.i3/config.base) and then run:
```Shell
j4-make-config
```
