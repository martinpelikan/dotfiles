function paclist --description 'List pacman explicitly installed packages not part of base/base-devel'
    pacman -Qgq base base-devel | sort > /tmp/basepackages.txt
    pacman -Qqe | sort > /tmp/installedpackages.txt
    comm -23 /tmp/installedpackages.txt /tmp/basepackages.txt
    rm -f /tmp/basepackages.txt /tmp/installedpackages.txt
end
