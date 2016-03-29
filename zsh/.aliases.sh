if [ -z "$SSH_CLIENT" ]
then
    if hash nvim 2>/dev/null; then
        alias vim='nvim'
        alias vi='nvim'
    else
        echo "neovim missing? can't alias vim=nvim"
    fi
fi

alias :e='nvim'
alias :E='nvim .'
alias :q='exit'

# Shorthand for sack/sag in ~/bin
alias S=sack

alias -s jpg=chromium
alias -s pdf=chromium
alias -s png=chromium

alias -s wmv=vlc

alias -s cfg=vim
alias -s md=vim
alias -s rst=vim
alias -s txt=vim

pip2upgrade() {
    pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip2 install -U
}
pip2track() {
    pip2 freeze | grep -v '^\-e' | cut -d = -f 1 > ~/dotfiles/packages/pip2.txt
}
pip2install() {
    sudo pip2 install --upgrade $( < ~/dotfiles/packages/pip2.txt )
}
pip3upgrade() {
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip3 install -U
}
pip3track() {
    pip3 freeze | grep -v '^\-e' | cut -d = -f 1  > ~/dotfiles/packages/pip3.txt
}
pip2install() {
    sudo pip3 install --upgrade $( < ~/dotfiles/packages/pip3.txt )
}
# Would be nicer if we could use an exclusion file instead of this awk.
pacnativebackup() {
    pacman -Qein | awk '/^Name/ { name=$3 } /^Groups/ {
        if ( \
            $3 != "base" &&
            $3 != "base-devel" &&
            $3 != "infinality-bundle" &&
            $3 != "xorg-drivers" &&
            name != "gimp" &&
            name != "lib32-alsa-plugins" &&
            name != "linux-headers" &&
            name != "playonlinux" &&
            name != "sane" &&
            name != "skype" &&
            name != "virtualbox" &&
            name != "virtualbox-guest-utils" &&
            name != "yaourt" \
        ) { print name }
    }' > ~/dotfiles/packages/pacman.native.txt
}
pacforeignbackup() {
    pacman -Qqem > ~/dotfiles/packages/pacman.foreign.txt
}
vboxmodprobe() {
    sudo modprobe -a vboxnetflt vboxnetadp vboxpci vboxdrv
}
