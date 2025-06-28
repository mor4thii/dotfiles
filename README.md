# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

The terminal emulator I use is Ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management.

I use taskwarrior and timewarrior for keeping track of things at work.

I currently migrate to neovim as my editor of choice.

In my work toolchain I use sdkman and nvm to manage JVM and JS versions and I prefer pnpm over npm or yarn for dependency management in JS.
I use brew to install stuff there, as well.

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
- Plasma/kzones

## Tools I like

There are some more tools that I like to use on a daily basis.
From this list, we can install fd, fzf, rg, thefuck, and tldr using `pacman`.

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [rg](https://github.com/BurntSushi/ripgrep)
- [thefuck](https://github.com/nvbn/thefuck)
- [tldr](https://github.com/tealdeer-rs/tealdeer)

These other tools need manual steps
- [miniforge](https://github.com/conda-forge/miniforge)
- [TeXlive](https://www.tug.org/texlive/quickinstall.html)
- [yay](https://github.com/Jguer/yay)

## For wallpapers

- https://simpledesktops.com/browse/

Or use one of the ones in the Wallpapers folder, kindly provided by https://github.com/Noctax/Noctax-Wallpapers

## CachyOS

Follow instruction on https://wiki.cachyos.org/ for installing using the GUI installer iso, choosing 
- Limine,
- btrfs,
- Plasma Desktop

Make sure to deselect packages that have cachyOS-specific naming, as well as alacritty, micro, and some other unused tools.

Then, follow steps for [post install](https://wiki.cachyos.org/configuration/post_install_setup/) including apparmor and zsh switch.
Also follow steps regarding Steam in the [Gaming](https://wiki.cachyos.org/configuration/gaming/) section. Don't forget to set games to using performance mode

```
LD_PRELOAD="" game-performance %command%
```

Use `active` pstate and powersafe governor, also as preference, c.f. [General System Tweaks](https://wiki.cachyos.org/configuration/general_system_tweaks/)

### (For now) Manual steps
Set up git SSH key, clone this repo and install the additional tools listed above.
Then:

```shell
sudo pacman -S ghostty neovim tree stow fd fzf ripgrep tealdeer thefuck
```

```shell
curl -sS https://starship.rs/install.sh | sh
```

```shell
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```shell
stow -t $HOME --stow ghostty git nvim profile ssh-priv starship zsh
```

```shell
sudo pacman -S obs-studio obs-vkcapture lib32-obs-vkcapture alsa-scarlett-gui
```

```shell
yay -S wl-clipboard
```

- In KDE System Settings, enable HDR.
- Also check Audio setup
- Apply https://github.com/catppuccin/firefox (Moccha Mauve)
- Apply https://github.com/catppuccin/kde (Moccha Mauve) 
- Apply the kzones layout in KDE kwin settings
- Apply https://github.com/catppuccin/limine (Mocha Mauve)
  - Also set timeout to 2s and add `interface_branding:`

> In KDE, X11 sessions can be switched on and off in System Settings. Search for sddm

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
