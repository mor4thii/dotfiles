# User configuration

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim

export FZF_BASE=/usr/share/fzf

## zsh options

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='(&|[bf]g|c|clear|history|exit|q|pwd|* --help)'

### Changing directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

### History
setopt append_history
setopt share_history
setopt hist_ignore_space

### Expansion and Globbing
setopt extended_glob
setopt glob_dots

### Input/Output
setopt correct

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

function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Load and initialise completion system
autoload -Uz compinit
compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/fred/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

