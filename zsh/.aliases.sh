if [ -z "$SSH_CLIENT" ]
then
    if hash nvim 2>/dev/null; then
        alias -g vim='nvim'
    else
        echo "neovim missing? can't alias vim=nvim"
    fi
fi

alias pip2upgrade="pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip2 install -U"
alias pip3upgrade="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip3 install -U"

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
