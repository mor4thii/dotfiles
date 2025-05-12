export PATH="$HOME/homebrew/bin:$PATH"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
eval "$(brew shellenv)"
