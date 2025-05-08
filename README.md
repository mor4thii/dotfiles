# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

```bash
stow -t $HOME --stow package [package...]
```

```bash
stow -t $HOME --stow zsh ghostty starship nvim
```


The terminal emulator I use is Ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management.

I use taskwarrior and timewarrior for keeping track of things.

I currently migrate to neovim as my editor of choice.

In my toolchain I use sdkman and nvm to manage JVM and JS versions and I prefer pnpm over npm or yarn for dependency management in JS.
On my Mac, I use brew to install stuff.

## Supported tools

In no particular order...

- Ghostty
- zsh
  - sdkman
  - nvm
  - pnpm
  - brew
  - zap
- starship.rs
- taskwarrior
- timewarrior
- neovim
- ssh

## TODO
- https://github.com/anametologin/krohnkite
