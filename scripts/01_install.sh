#!/bin/bash
set -x

export DEVICE="/dev/sda"
export NEW_USER="mpelikan"

# Partition settings, by default:
# / = 20GB
# swap = 4GB
# /home = rest of disk
ROOT_END=20
SWAP_SIZE=4
SWAP_END=$[ROOT_END+SWAP_SIZE]

# Use NTP, unnecessary?
timedatectl set-ntp true

# Create partitions
parted "$DEVICE" mklabel msdos
parted "$DEVICE" mkpart primary ext4 1MiB "$ROOT_END"GiB
parted "$DEVICE" set 1 boot on
parted "$DEVICE" mkpart primary linux-swap "$ROOT_END"GiB "$SWAP_END"GiB
parted "$DEVICE" mkpart primary ext4 "$SWAP_END"GiB 100%

# Create file systems
mkfs.ext4 "$DEVICE"1
mkfs.ext4 "$DEVICE"3
mkswap "$DEVICE"2
swapon "$DEVICE"2

# Mount the file systems
mount "$DEVICE"1 /mnt
mkdir -p /mnt/home
mount "$DEVICE"3 /mnt/home

# TODO: Programatically pick fastest mirror here.
pacstrap /mnt base base-devel

# Make sure partitions are mounted to create proper fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Locale, bootleader, hostname, network, user setup
curl -fLo "02_chroot_install.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/02_chroot_install.sh
chmod u+x 02_chroot_install.sh
cp 02_chroot_install.sh /mnt
arch-chroot /mnt ./02_chroot_install.sh

# To be invoked by user on first login
curl -fLo "03_first_boot.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/03_first_boot.sh
chmod u+x 03_first_boot.sh
mv 03_first_boot.sh "/mnt/home/$NEW_USER"

# Clean up scripts from /
rm /mnt/01_install.sh /mnt/02_chroot_install.sh

umount -R /mnt
echo "Reboot when ready, unmount ISO/CD drive."
