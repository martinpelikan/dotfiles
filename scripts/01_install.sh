#!/bin/bash
set -x

export DEVICE="/dev/sda"
ROOT_END=20
SWAP_SIZE=4
SWAP_END=$[ROOT_END+SWAP_SIZE]

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

# TODO: Update the mirror list using reflector?
pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

curl -fLo "02_chroot_install.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/02_chroot_install.sh
curl -fLo "03_first_boot.sh" https://raw.githubusercontent.com/martinpelikan/dotfiles/master/scripts/03_first_boot.sh
chmod u+x 02_chroot_install.sh
chmod u+x 03_first_boot.sh
cp 02_chroot_install.sh /mnt
cp 03_first_boot.sh /mnt
arch-chroot /mnt ./02_chroot_install.sh

# Clean up scripts from /
rm 02_chroot_install.sh 03_first_boot.sh

umount -R /mnt
echo "Reboot when ready, unmount ISO/CD drive."
