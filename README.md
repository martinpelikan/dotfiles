# dotfiles
This project will eventually provide a set of scripts/dotfiles to set up my
ideal dev environment in a minimal Arch install.

## Packages

### Pacman/Native
Back up the list of installed native non-base packages:

```Shell
pacman -Qein | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }' > pacman.native.txt
```

Restore/install all the packages:

```Shell
sudo pacman -S --needed --noconfirm $(< pacman.native.txt)
```

## Infinality
```Shell
```

## Basic Arch setup guide
These steps are meant as a reminder for me, not as a
[general guide](https://wiki.archlinux.org/index.php/beginners'_guide).

This was mostly tested/executed in a VM environment, YMMV.

```Shell
bash -c "$(curl fsSL https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/01_install.sh)"
```

## TODO/investigate
* tmux

## Stow
[GNU Stow](https://www.gnu.org/software/stow/) will create symlinks to the
`dotfiles` directory from the default application paths.

From the dotfiles directory, run:
```Shell
stow -R bash i3 neovim pudb termite vim x zsh
```

## vim/neovim
Bootstrap the vim-plug plugin manager:
```Shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then install all the plugins in vim:
```VimL
:PlugInstall
```

## i3config
The [i3config](./i3/.i3/config) is templated using
[j4tools](http://www.j4tools.org/). Make modifications to
[config.base](./i3/.i3/config.base) and then run:
```Shell
j4-make-config
```
