COMPLETION_WAITING_DOTS="true"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
plugins=(git wd last-working-dir common-aliases archlinux)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt autocd correct correctall extendedglob histignorealldups nomatch notify sharehistory
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# Put any machine-specific or sensitive info here
if [ -e "$HOME/Dotfiles/private_rcs/zsh" ]
then
    source "$HOME/Dotfiles/private_rcs/zsh"
fi
# Collect all the aliases in a single location
if [ -e "$HOME/.aliases.sh" ]
then
    source "$HOME/.aliases.sh"
fi
# Get proper colors for all file types
eval `dircolors $HOME/.dircolors`
