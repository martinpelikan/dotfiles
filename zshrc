# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mpelikan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
