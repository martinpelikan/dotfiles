if [ -z "$SSH_CLIENT" ]
then
    if hash nvim 2>/dev/null; then
        alias vim='nvim'
    else
        echo "neovim missing? can't alias vim=nvim"
    fi
fi

alias -s jpg=chromium
alias -s pdf=chromium
alias -s png=chromium

alias -s wmv=vlc

alias -s cfg=vim
alias -s md=vim
alias -s py=vim
alias -s rst=vim
alias -s txt=vim
