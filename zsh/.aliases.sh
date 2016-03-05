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

alias -s jpg=chromium
alias -s pdf=chromium
alias -s png=chromium

alias -s wmv=vlc

alias -s cfg=vim
alias -s md=vim
alias -s py=vim
alias -s rst=vim
alias -s txt=vim

pip2upgrade() {
    pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip2 install -U
}
pip2track() {
    pip2 freeze > ~/dotfiles/packages/pip2.txt
}
pip3upgrade() {
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip3 install -U
}
pip3track() {
    pip3 freeze > ~/dotfiles/packages/pip3.txt
}
pacnativebackup() {
    pacman -Qein | awk '/^Name/ { name=$3 } /^Groups/ {
        if ( \
            $3 != "base" &&
            $3 != "base-devel" &&
            $3 != "infinality-bundle" &&
            name != "yaourt" &&
            name != "virtualbox" &&
            name != "xf86-video-ati" &&
            name != "skype" &&
            name != "playonlinux" &&
            name != "lib32-alsa-plugins" &&
            name != "linux-headers" \
        ) { print name }
    }' > ~/dotfiles/packages/pacman.native.txt
}
pacforeignbackup() {
    pacman -Qqem > ~/dotfiles/packages/pacman.foreign.txt
}
