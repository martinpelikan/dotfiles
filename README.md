# dotfiles
This repository tracks my dotfiles and provides scripts that set up a base Arch
install and bootstrap my dev setup.

## Basic Arch setup guide
To set up a base Arch install, you should follow the [Installation
guide](https://wiki.archlinux.org/index.php/installation_guide).

I've written some pretty terrible (and now outdated) scripts to do the basic
setup with some reasonable defaults. You'll likely want to adjust some options
or remove sections of the scripts, as they will partition your disk. This was
tested in a VM environment, YMMV (Piping to shell from the Interwebs? What can
possibly go wrong?)
```Shell
curl -fLo "01_install.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/01_install.sh
bash ./01_install.sh
```

## Package Tracking
I track installed packages in [packages.txt](./packages.txt) as a way to show
what tools I'm currently using, and as a means to restore my setup without
having to remember and explicitly install everything. This list can be
generated using `paclist` defined in
[paclist.fish](./fish/.config/fish/functions/paclist.fish)

## Fonts
The solution to this problem used to be to install Infinality, but it appears
it is no longer being maintained. Instead, follow these instructions
[here](https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671).

## Stow
I use [GNU Stow](https://www.gnu.org/software/stow/) to automatically create
symlinks to my `dotfiles` repository.

From the dotfiles directory, run:
```Shell
stow -R application bin compton dircolors dunst fish git i3 i3blocks neovim packages pudb sack scripts termite vim x
```

## neovim/vim
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

## TODO
* Use [Polybar](https://github.com/jaagr/polybar) instead of i3bar
* Use [tmux](https://github.com/tmux/tmux) and [alacritty](https://github.com/jwilm/alacritty) instead of Termite
* Use [Ansible](https://www.ansible.com/) instead of my setup scripts
* Use [ripgrep](https://github.com/BurntSushi/ripgrep) instead of
  [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) if I can
  get it to play nicely with other tools
