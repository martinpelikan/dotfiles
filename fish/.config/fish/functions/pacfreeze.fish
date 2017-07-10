function pacfreeze --description 'List pacman explicitly installed packages not part of base/base-devel'
    echo base > /tmp/installedpackages.txt
    echo base-devel >> /tmp/installedpackages.txt
    pacman -Qqe >> /tmp/installedpackages.txt
    pacman -Qgq base base-devel | sort --output=/tmp/basepackages.txt
    sort /tmp/installedpackages.txt --output=/tmp/installedpackages.txt
    comm -23 /tmp/installedpackages.txt /tmp/basepackages.txt
    rm -f /tmp/basepackages.txt /tmp/installedpackages.txt
end
