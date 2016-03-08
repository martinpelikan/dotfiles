# dotfiles
This project will eventually provide a set of scripts/dotfiles to set up my
ideal dev environment in a minimal Arch install.

## Basic Arch setup guide
These steps are meant as a reminder for me, not as a
[general guide](https://wiki.archlinux.org/index.php/beginners'_guide).

This was mostly tested/executed in a VM environment, YMMV (Piping to shell from the Interwebs? What can possibly go wring?)
```Shell
curl -fLo "01_install.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/01_install.sh
bash ./01_install.sh
```

## Package Management
Back up the list of installed native non-base packages:
```Shell
pacman -Qein | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }' > pacman.native.txt
```

Restore/install all the packages:
```Shell
sudo pacman -S --needed --noconfirm $(< pacman.native.txt)
```

## Infinality
Fonts are a truly the greatest unsolved problem and a horrible thing, but they are even more horrible without [Infinality](https://bohoomil.com/)...
```Shell
# Add Infinality repos
sudo cat >> /etc/pacman.conf << EOF

[infinality-bundle]
Server = http://bohoomil.com/repo/$arch

[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts
EOF
# Add Infinality signatures
sudo pacman-key -r 962DDE58
sudo pacman-key --lsign-key 962DDE58
sudo pacman -S infinality-bundle
```

## Stow
[GNU Stow](https://www.gnu.org/software/stow/) will create symlinks to the
`dotfiles` directory from the default application paths.

From the dotfiles directory, run:
```Shell
stow -R bin i3 neovim pudb termite vim x zsh
```

## vim/neovim
Bootstrap the vim-plug plugin manager:
```Shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then install all the plugins in nvim:
```VimL
:PlugInstall
```
or
```Shell
nvim +PlugInstall +qall
```

## i3config
The [i3config](./i3/.i3/config) is templated using
[j4tools](http://www.j4tools.org/). Make modifications to
[config.base](./i3/.i3/config.base) and then run:
```Shell
# Pick your theme if you don't like tango-dark
j4-make-config tango-dark
```

## tmux
TODO / investigate
