#!/bin/bash
set -x

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

# Create my user and add it to wheel group
useradd -m -G wheel -s /bin/zsh "$NEW_USER"
sed -i -e 's/# %wheel ALL/%wheel ALL/' /etc/sudoers

# XXX: Change these passwords!
echo "root:$PASSWORD" | chpasswd
echo "$NEW_USER:$PASSWORD" | chpasswd
