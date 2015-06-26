# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"
plugins=(git wd last-working-dir common-aliases)
eval `dircolors $HOME/.dircolors`
source $ZSH/oh-my-zsh.sh
if [ -e "$HOME/Dotfiles/private_rcs/zsh" ]
then
    source "$HOME/Dotfiles/private_rcs/zsh"
fi
