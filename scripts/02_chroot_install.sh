#!/bin/bash
HOSTNAME="mpelikan-arch"
PASSWORD="ChangeMe321"
TIMEZONE="America/Vancouver"
NEW_USER="mpelikan"

# Locale settings
sed -i -e 's/#en_US\.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -s /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
hwclock --systohc --utc

# Boot loader
pacman -S --noconfirm grub os-prober
grub-install "$DEVICE"
grub-mkconfig -o /boot/grub/grub.cfg

# Hostname
echo "$HOSTNAME" > /etc/hostname
sed -i -e "s/localhost$/localhost $HOSTNAME/" /etc/hosts

# Network
IFACE_NAME=$(ls /sys/class/net | expand | head -n1)
systemctl enable dhcpcd@"$IFACE_NAME".service

# Add Infinality repos and sign
sudo cat >> /etc/pacman.conf << EOF
[infinality-bundle]
Server = http://bohoomil.com/repo/$arch
[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts
EOF
sudo pacman-key -r 962DDE58
sudo pacman-key --lsign-key 962DDE58

# Totally safe installation of packages here
pacman -S git
git clone https://github.com/martinpelikan/dotfiles.git
pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.native.txt)
pacman -S --needed --noconfirm $(< dotfiles/packages/pacman.external.txt)
yaourt -S --needed --noconfirm $(< dotfiles/packages/pacman.foreign.txt)
systemctl enable lightdm.service

# Add my user
useradd -m -G wheel -s /bin/zsh "$NEW_USER"
# Password
echo "root:$PASSWORD" | chpasswd
echo "$NEW_USER:$PASSWORD" | chpasswd

sed -i -e 's/# %wheel ALL/%wheel ALL/' /etc/sudoers
