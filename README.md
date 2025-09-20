# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

The terminal emulator I use is Ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management. I currently migrate to neovim as my editor of choice.

## TODO

- Better job at de-duplicating work and private `.zshrc` file

## Supported tools

Shared configs that are the same on every machine are just the following.

- ghostty
- nvim
- starship

On my private machines, I have configuration for these tools.

- electron
- git
- kzones
- plasma
- profile
- ssh-priv

On my work machine, I use these tools in addition to the shared list above.

- git-work
- ideavim
- profile-work
- ssh-work
- task
- timew

## Tools I like

There are some more tools that I like to use on a daily basis, but that have no dedicated configuration to share between machines.
From this list, we can install `fd`, `fzf`, `rg`, `thefuck`, and `tldr` using `pacman`.

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [rg](https://github.com/BurntSushi/ripgrep)
- [thefuck](https://github.com/nvbn/thefuck)
- [tldr](https://github.com/tealdeer-rs/tealdeer)

These other tools need manual steps:

- [miniforge](https://github.com/conda-forge/miniforge)
- [TeXlive](https://www.tug.org/texlive/quickinstall.html)
- [yay](https://github.com/Jguer/yay)
- [sdkman](https://sdkman.io/)
- [pnpm](https://pnpm.io/installation#on-posix-systems)

## CachyOS

Follow instruction on the [CachyOS wiki](https://wiki.cachyos.org/) for installing using the GUI installer iso, choosing

- Limine,
- btrfs,
- Plasma Desktop

Only deselect 'COS shell configurations' for maximum stability of the installer.

Then, follow steps for [post install](https://wiki.cachyos.org/configuration/post_install_setup/) including apparmor and zsh switch.
Also follow steps regarding Steam in the [Gaming](https://wiki.cachyos.org/configuration/gaming/) section. Don't forget to set games to using performance mode

```
LD_PRELOAD="" game-performance %command%
```

Use `active` pstate and powersafe governor, also as preference, c.f. [General System Tweaks](https://wiki.cachyos.org/configuration/general_system_tweaks/)

### (For now) Manual steps

Set up git SSH key, clone this repo and install the additional tools listed above.

Remember to check ssh key file and directory permissions. To fix them, use something similar to this:

```shell
chmod 700 ~/.ssh/
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
```

Then:

```shell
sudo pacman -S ghostty neovim tree stow fd fzf ripgrep tealdeer thefuck luarocks lazygit ast-grep go python-pip rustup php composer ruby mermaid-cli cpanminus python-pynvim
```

```shell
curl -sS https://starship.rs/install.sh | sh
```

```shell
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```shell
stow -t $HOME --stow ghostty git nvim profile ssh-priv starship zsh electron
```

```shell
sudo pacman -S obs-studio-browser obs-vkcapture lib32-obs-vkcapture alsa-scarlett-gui
```

```shell
rustup default stable
```

```shell
yay -S wl-clipboard juliaup discord-canary
```

Reboot and continue in ghostty from now

```shell
pnpm env use --global lts
```

```shell
sdk install java 25-zulu
```

```shell
sdk install maven 3.9.11
```

```shell
juliaup add release && juliaup default release
```

```shell
pnpm add -g tree-sitter-cli && pnpm approve-builds -g
```

```shell
cpan App::ucpan
```

```shell
cpan Bundle::CPAN
```

```shell
cpanm -n Neovim::Ext --sudo
```

```shell
gem install neovim
```

In KDE System Settings
- Quick Settings -> Animation Speed: instant
- Keyboard -> Key Bindings -> Compose key to right CTRL
- Check Audio setup
- Display & Monitor (For LG C2)
  - 120Hz
  - Adaptive Sync always
  - RGB Full
  - Enable HDR & after Apply, calibrate
  - Prefer Color accuracy
  - Automatic color resolution limit
  - sRGB 40%
- Colors & Themes -> Apply Breeze Dark again
- Colors & Themes -> Splash Screen: Reapply Breeze
- Colors & Themes -> SDDM: Apply Plasma Settings
- Colors & Themes -> Boot Splash Screen: Apply BGRT
- Apply the kzones layout in KDE kwin settings
- In nvim, run `:TSInstall css latex norg scss svelte typst vue`

> In KDE, X11 sessions can be switched on and off in System Settings. Search for sddm

### For wallpapers

There is a web resource I tend to use to search for wallpapers.

- <https://simpledesktops.com/browse/>

Or use one of the ones in the Wallpapers folder, kindly provided by <https://github.com/Noctax/Noctax-Wallpapers> and <https://github.com/orangci/walls-catppuccin-mocha>

### Fonts

I use [Inter](https://rsms.me/inter/download/) for UI and [JetBrains Mono (Nerd Font)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip) for monospaced fonts.

### DaVinci

See the [Arch page](https://wiki.archlinux.org/title/DaVinci_Resolve) for install instructions.

### Bluetooth

CachyOS, as of time of writing, provides bluetoothctl for bluetooth device management.
To connect to the XBox Controller, the following steps can help

```shell
# Puts me into [bluetooth]# prompt
bluetoothctl
```

```shell
# Make sure the right bt controller is used
show
```

```shell
power on
discoverable on
pairable on
```

```shell
# Will start printing out discovered devices, find right MAC of target device
scan on
```

```shell
pair <dev>
```

```shell
# This should also turn off discoverable, double-check with `show`
scan off
```

```shell
connect <dev>
trust <dev>
```

## Troubleshooting

If there are issues regarding PGP keys when running `pacman`, the following commands update the pacman keys.

```
sudo pacman-key --refresh-keys
sudo pacman -Sy
```

## Update Keychron firmware on Linux

See [QMK FAQ](https://docs.qmk.fm/faq_build#linux-udev-rules) for rules file to make the [launcher](https://launcher.keychron.com/) connect to the keyboard correctly.

## Work Mac

This section is way less elaborate as I focus on my private setup for now. I will revisit this once I need to reinstall my work machine.
However, here are some steps I needed to do to bring my work machine up to simpledesktops

```shell
brew install fish ast-grep lazygit wget tree-sitter ghostscript imagemagick tree-sitter-cli
```

```shell
pnpm add -g prettier markdown-toc markdownlint-cli2 @mermaid-js/mermaid-cli
```

I use `sdkman` and `pnpm` on my work machine. I needed to install `TeXlive` as well.
