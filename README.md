# dotfiles
This project will eventually provide a set of scripts/dotfiles to set up my
ideal dev environment in a minimal Arch install.

**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [dotfiles](#)
    - [Stow](#)
    - [vim/neovim](#)
    - [i3config](#)
    - [Packages](#)
        - [Pacman/Native](#)
    - [Infinality](#)
    - [TODO/investigate](#)

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

## Packages

### Pacman/Native
Back up the list of installed native non-base packages:

```Shell
pacman -Qein | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }' > pacman.native.txt
```

Restore/install all the packages:

```Shell
sudo pacman -S --needed $(< packages/pacman.native.txt)
```

## Infinality
Instructions here later.


## TODO/investigate
* tmux

## Basic Arch setup guide
These steps are meant as a reminder for me, not as a
[general guide](https://wiki.archlinux.org/index.php/beginners'_guide).

Also, these are mostly valid in a VM/VBox environment.

```Shell
timedatectl set-ntp true

# Create partitions
parted /dev/sda
mklabel msdos
mkpart primary ext4 1MiB 20GiB
set 1 boot on
mkpart primary linux-swap 20GiB 24GiB
mkpart primary ext4 24GiB 100%
quit

# Create file systems
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

# Mount the file systems
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home

# Move closest server to top of list.
# vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel

genfstab -U /mnt /mnt/etc/fstab
arch-chroot /mnt /bin/bash

# Locale settings
sed -i -e 's/#en_US\.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -s /usr/share/zoneinfo/America/Vancouver /etc/localtime
hwclock --systohc --utc

# Boot loader
pacman -S --noconfirm grub os-prober
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Hostname
echo "mpelikan-arch" > /etc/hostname
sed -i -e 's/localhost$/localhost mpelikan-arch/' /etc/hosts

# Network
# use ip link, then set DHCP on that.
systemctl enable dhcpcd@interface.service

# Password
passwd

# Fin
exit
umount -R /mnt
reboot
```
