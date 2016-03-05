#!/bin/bash
HOSTNAME="mpelikan-arch"
PASSWORD="ChangeMe321"
TIMEZONE="America/Vancouver"
NEW_USER="mpelikan"

# Locale
sed -i -e 's/#en_US\.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -s /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
hwclock --systohc --utc

# Bootloader
pacman -S --noconfirm grub os-prober
grub-install "$DEVICE"
grub-mkconfig -o /boot/grub/grub.cfg

# Hostname
echo "$HOSTNAME" > /etc/hostname
sed -i -e "s/localhost$/localhost $HOSTNAME/" /etc/hosts

# Network
IFACE_NAME=$(ls /sys/class/net | expand | head -n1)
systemctl enable dhcpcd@"$IFACE_NAME".service

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

# Install git
pacman -S --noconfirm git

# Install yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

# Totally safe installation of packages here
git clone https://github.com/martinpelikan/dotfiles.git
pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.native.txt)
pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.external.txt)
yaourt -S --needed --noconfirm $(< dotfiles/packages/pacman.foreign.txt)
pip2 install -r dotfiles/packages/pip2.txt
pip3 install -r dotfiles/packages/pip3.txt

# Create my user and add it to wheel group
useradd -m -G wheel -s /bin/zsh "$NEW_USER"
sed -i -e 's/# %wheel ALL/%wheel ALL/' /etc/sudoers

# XXX: Change these passwords!
echo "root:$PASSWORD" | chpasswd
echo "$NEW_USER:$PASSWORD" | chpasswd

# Enable services
systemctl enable lightdm.service
