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

source /usr/share/doc/pkgfile/command-not-found.zsh

# Load and initialise completion system
autoload -Uz compinit
compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/fred/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# PERL stuff
PATH="/home/fred/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/fred/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/fred/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/fred/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/fred/perl5"; export PERL_MM_OPT;

# Ruby
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# Rust
export RUST_HOME="$HOME/.cargo/bin:$PATH"
case ":$PATH:" in
  *":$RUST_HOME:"*) ;;
  *) export PATH="$RUST_HOME:$PATH" ;;
esac

