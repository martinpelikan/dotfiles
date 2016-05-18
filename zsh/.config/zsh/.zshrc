ZSH=/usr/share/oh-my-zsh
COMPLETION_WAITING_DOTS="true"
plugins=(git wd last-working-dir common-aliases archlinux)

# Have to modify pkgbuild for powerlevel9k to install to
# /usr/share/oh-my-zsh/themes
ZSH_THEME="zsh-theme-powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('context' 'dir' 'vcs')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('status' 'time')

HISTFILEDIR="$XDG_DATA_HOME"/zsh/
export HISTFILE="$HISTFILEDIR"/history
HISTSIZE=10000
SAVEHIST=100000
if [[ ! -d $HISTFILEDIR ]]; then
    mkdir -p "$HISTFILEDIR"
    touch "$HISTFILE"
fi

DISABLE_AUTO_UPDATE="true"

setopt autocd correct extendedglob histignorealldups nomatch notify sharehistory
zstyle :compinstall filename '$ZDOTDIR/zshrc'

autoload -Uz compinit
compinit

# Cache dir must be defined before oh-my-zsh.sh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir -p "$ZSH_CACHE_DIR"
fi

source $ZSH/oh-my-zsh.sh

# Put any machine-specific or sensitive info here
if [ -e "$ZDOTDIR/zshrc.private" ]
then
    source -p "$ZDOTDIR/zshrc.private"
fi

# Source all the command/filetype aliases
if [ -e "$ZDOTDIR/aliases.sh" ]
then
    source "$ZDOTDIR/aliases.sh"
fi

# Get proper colors for all file types
eval `dircolors $ZDOTDIR/dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Why on earth would you want fuzzy search here...
bindkey '^R' history-incremental-search-backward
