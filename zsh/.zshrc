# User configuration

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim

export FZF_BASE=/usr/share/fzf

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='(&|[bf]g|c|clear|history|exit|q|pwd|* --help)'

setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt extendedglob

# User functions

# 3rd party inits

## zap 
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/fzf"
plug "sdiebolt/zsh-ssh-agent"
plug "embeddedpenguin/sanekeybinds"
plug "atoftegaard-git/zsh-omz-autocomplete"

plug "zsh-users/zsh-syntax-highlighting"

## TeXLive
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

## thefuck
eval $(thefuck --alias)

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
## <<< conda initialize <<<

eval "$(starship init zsh)"

source /usr/share/doc/pkgfile/command-not-found.zsh

# Load and initialise completion system
autoload -Uz compinit
compinit
