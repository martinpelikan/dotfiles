#!/bin/bash
set -x

COUNTRY=Canada
NEW_USER=mpelikan
GPU_DRIVER="xf86-video-vesa"

# Get a sane mirrorlist to speed this up
sudo pacman -S --noconfirm reflector
sudo /usr/bin/reflector --protocol http --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist

# Add Infinality repos
# Note: pacman.conf owned by root, not wheel
sudo runuser -l root -c 'cat >> /etc/pacman.conf << EOF

[infinality-bundle]
Server = http://bohoomil.com/repo/\$arch

[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts
EOF'
# Add Infinality signatures
sudo pacman-key -r 962DDE58
sudo pacman-key --lsign-key 962DDE58

# Sync the new databases/upgrade outdated packages
sudo pacman -Syu --noconfirm

# Install git
sudo pacman -S --noconfirm git

# Install yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ..
rm -rf yaourt package-query

# Totally safe package installation here
git clone https://github.com/martinpelikan/dotfiles.git
sudo pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.native.txt)
sudo pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.external.txt)
sudo pacman -S --needed --noconfirm "$GPU_DRIVER"
# makepkg doesn't like being run as root :(
yaourt -S --needed --noconfirm $(< dotfiles/packages/pacman.foreign.txt)
sudo pip2 install -r dotfiles/packages/pip2.txt
sudo pip3 install -r dotfiles/packages/pip3.txt

# Get all the dotfiles
cd dotfiles
stow -R i3 neovim pudb termite vim x zsh
cd ..

# Install the best editor
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# And all of the awesome plugins
nvim +PlugInstall -c "silent only" +qall

# Enable services
sudo systemctl enable lightdm.service
sudo runuser -l root -c "echo COUNTRY=$COUNTRY > /etc/conf.d/reflector.conf"
sudo systemctl enable reflector.timer

# zsh > bash, but has to be installed first
sudo chsh "$NEW_USER" -s `which zsh`

# I still don't get fonts. Oh well.
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Ubuntu Mono derivativce Powerline Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete.ttf
cd ~
