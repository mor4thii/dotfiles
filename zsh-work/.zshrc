# User configuration

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim

export XDG_CONFIG_HOME="$HOME/.config"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='(&|[bf]g|c|clear|history|exit|q|pwd|* --help)'

setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt extendedglob

# User functions

# List all applications with LISTEN port open
function macnst (){
    netstat -Watnlv | grep LISTEN | awk '{"ps -o comm= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print colred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
}

# 3rd party inits

## zap 
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/fzf"
plug "sdiebolt/zsh-ssh-agent"
plug "embeddedpenguin/sanekeybinds"
plug "atoftegaard-git/zsh-omz-autocomplete"

plug "zsh-users/zsh-syntax-highlighting"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

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

# Load and initialise completion system
autoload -Uz compinit
compinit
